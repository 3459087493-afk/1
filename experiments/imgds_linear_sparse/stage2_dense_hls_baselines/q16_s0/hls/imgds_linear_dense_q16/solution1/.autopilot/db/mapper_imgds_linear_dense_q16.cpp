#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const char *msg;
    const size_t line;
    SimException(const char *msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const char *msg)
  {
    std::string s;
    s += "at line ";
    s += std::to_string(line);
    s += " occurred problem: ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" void imgds_linear_dense_q16(Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, Byte<2>*, volatile void *, volatile void *);
extern "C" void apatb_imgds_linear_dense_q16_hw(volatile void * __xlx_apatb_param_input_0, volatile void * __xlx_apatb_param_input_1, volatile void * __xlx_apatb_param_input_2, volatile void * __xlx_apatb_param_input_3, volatile void * __xlx_apatb_param_input_4, volatile void * __xlx_apatb_param_input_5, volatile void * __xlx_apatb_param_input_6, volatile void * __xlx_apatb_param_input_7, volatile void * __xlx_apatb_param_input_8, volatile void * __xlx_apatb_param_input_9, volatile void * __xlx_apatb_param_input_10, volatile void * __xlx_apatb_param_input_11, volatile void * __xlx_apatb_param_input_12, volatile void * __xlx_apatb_param_input_13, volatile void * __xlx_apatb_param_input_14, volatile void * __xlx_apatb_param_input_15, volatile void * __xlx_apatb_param_input_16, volatile void * __xlx_apatb_param_input_17, volatile void * __xlx_apatb_param_input_18, volatile void * __xlx_apatb_param_input_19, volatile void * __xlx_apatb_param_input_20, volatile void * __xlx_apatb_param_input_21, volatile void * __xlx_apatb_param_input_22, volatile void * __xlx_apatb_param_input_23, volatile void * __xlx_apatb_param_input_24, volatile void * __xlx_apatb_param_input_25, volatile void * __xlx_apatb_param_input_26, volatile void * __xlx_apatb_param_input_27, volatile void * __xlx_apatb_param_input_28, volatile void * __xlx_apatb_param_input_29, volatile void * __xlx_apatb_param_input_30, volatile void * __xlx_apatb_param_input_31, volatile void * __xlx_apatb_param_input_32, volatile void * __xlx_apatb_param_input_33, volatile void * __xlx_apatb_param_input_34, volatile void * __xlx_apatb_param_input_35, volatile void * __xlx_apatb_param_input_36, volatile void * __xlx_apatb_param_input_37, volatile void * __xlx_apatb_param_input_38, volatile void * __xlx_apatb_param_input_39, volatile void * __xlx_apatb_param_input_40, volatile void * __xlx_apatb_param_input_41, volatile void * __xlx_apatb_param_input_42, volatile void * __xlx_apatb_param_input_43, volatile void * __xlx_apatb_param_input_44, volatile void * __xlx_apatb_param_input_45, volatile void * __xlx_apatb_param_input_46, volatile void * __xlx_apatb_param_input_47, volatile void * __xlx_apatb_param_input_48, volatile void * __xlx_apatb_param_input_49, volatile void * __xlx_apatb_param_input_50, volatile void * __xlx_apatb_param_input_51, volatile void * __xlx_apatb_param_input_52, volatile void * __xlx_apatb_param_input_53, volatile void * __xlx_apatb_param_input_54, volatile void * __xlx_apatb_param_input_55, volatile void * __xlx_apatb_param_input_56, volatile void * __xlx_apatb_param_input_57, volatile void * __xlx_apatb_param_input_58, volatile void * __xlx_apatb_param_input_59, volatile void * __xlx_apatb_param_input_60, volatile void * __xlx_apatb_param_input_61, volatile void * __xlx_apatb_param_input_62, volatile void * __xlx_apatb_param_input_63, volatile void * __xlx_apatb_param_logits_0, volatile void * __xlx_apatb_param_logits_1) {
using hls::sim::createStream;
  // Collect __xlx_input_0__tmp_vec
std::vector<Byte<2>> __xlx_input_0__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_0__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_0)[i]);
}
  int __xlx_size_param_input_0 = 16;
  int __xlx_offset_param_input_0 = 0;
  int __xlx_offset_byte_param_input_0 = 0*2;
  // Collect __xlx_input_1__tmp_vec
std::vector<Byte<2>> __xlx_input_1__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_1__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_1)[i]);
}
  int __xlx_size_param_input_1 = 16;
  int __xlx_offset_param_input_1 = 0;
  int __xlx_offset_byte_param_input_1 = 0*2;
  // Collect __xlx_input_2__tmp_vec
std::vector<Byte<2>> __xlx_input_2__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_2__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_2)[i]);
}
  int __xlx_size_param_input_2 = 16;
  int __xlx_offset_param_input_2 = 0;
  int __xlx_offset_byte_param_input_2 = 0*2;
  // Collect __xlx_input_3__tmp_vec
std::vector<Byte<2>> __xlx_input_3__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_3__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_3)[i]);
}
  int __xlx_size_param_input_3 = 16;
  int __xlx_offset_param_input_3 = 0;
  int __xlx_offset_byte_param_input_3 = 0*2;
  // Collect __xlx_input_4__tmp_vec
std::vector<Byte<2>> __xlx_input_4__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_4__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_4)[i]);
}
  int __xlx_size_param_input_4 = 16;
  int __xlx_offset_param_input_4 = 0;
  int __xlx_offset_byte_param_input_4 = 0*2;
  // Collect __xlx_input_5__tmp_vec
std::vector<Byte<2>> __xlx_input_5__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_5__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_5)[i]);
}
  int __xlx_size_param_input_5 = 16;
  int __xlx_offset_param_input_5 = 0;
  int __xlx_offset_byte_param_input_5 = 0*2;
  // Collect __xlx_input_6__tmp_vec
std::vector<Byte<2>> __xlx_input_6__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_6__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_6)[i]);
}
  int __xlx_size_param_input_6 = 16;
  int __xlx_offset_param_input_6 = 0;
  int __xlx_offset_byte_param_input_6 = 0*2;
  // Collect __xlx_input_7__tmp_vec
std::vector<Byte<2>> __xlx_input_7__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_7__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_7)[i]);
}
  int __xlx_size_param_input_7 = 16;
  int __xlx_offset_param_input_7 = 0;
  int __xlx_offset_byte_param_input_7 = 0*2;
  // Collect __xlx_input_8__tmp_vec
std::vector<Byte<2>> __xlx_input_8__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_8__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_8)[i]);
}
  int __xlx_size_param_input_8 = 16;
  int __xlx_offset_param_input_8 = 0;
  int __xlx_offset_byte_param_input_8 = 0*2;
  // Collect __xlx_input_9__tmp_vec
std::vector<Byte<2>> __xlx_input_9__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_9__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_9)[i]);
}
  int __xlx_size_param_input_9 = 16;
  int __xlx_offset_param_input_9 = 0;
  int __xlx_offset_byte_param_input_9 = 0*2;
  // Collect __xlx_input_10__tmp_vec
std::vector<Byte<2>> __xlx_input_10__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_10__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_10)[i]);
}
  int __xlx_size_param_input_10 = 16;
  int __xlx_offset_param_input_10 = 0;
  int __xlx_offset_byte_param_input_10 = 0*2;
  // Collect __xlx_input_11__tmp_vec
std::vector<Byte<2>> __xlx_input_11__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_11__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_11)[i]);
}
  int __xlx_size_param_input_11 = 16;
  int __xlx_offset_param_input_11 = 0;
  int __xlx_offset_byte_param_input_11 = 0*2;
  // Collect __xlx_input_12__tmp_vec
std::vector<Byte<2>> __xlx_input_12__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_12__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_12)[i]);
}
  int __xlx_size_param_input_12 = 16;
  int __xlx_offset_param_input_12 = 0;
  int __xlx_offset_byte_param_input_12 = 0*2;
  // Collect __xlx_input_13__tmp_vec
std::vector<Byte<2>> __xlx_input_13__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_13__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_13)[i]);
}
  int __xlx_size_param_input_13 = 16;
  int __xlx_offset_param_input_13 = 0;
  int __xlx_offset_byte_param_input_13 = 0*2;
  // Collect __xlx_input_14__tmp_vec
std::vector<Byte<2>> __xlx_input_14__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_14__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_14)[i]);
}
  int __xlx_size_param_input_14 = 16;
  int __xlx_offset_param_input_14 = 0;
  int __xlx_offset_byte_param_input_14 = 0*2;
  // Collect __xlx_input_15__tmp_vec
std::vector<Byte<2>> __xlx_input_15__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_15__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_15)[i]);
}
  int __xlx_size_param_input_15 = 16;
  int __xlx_offset_param_input_15 = 0;
  int __xlx_offset_byte_param_input_15 = 0*2;
  // Collect __xlx_input_16__tmp_vec
std::vector<Byte<2>> __xlx_input_16__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_16__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_16)[i]);
}
  int __xlx_size_param_input_16 = 16;
  int __xlx_offset_param_input_16 = 0;
  int __xlx_offset_byte_param_input_16 = 0*2;
  // Collect __xlx_input_17__tmp_vec
std::vector<Byte<2>> __xlx_input_17__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_17__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_17)[i]);
}
  int __xlx_size_param_input_17 = 16;
  int __xlx_offset_param_input_17 = 0;
  int __xlx_offset_byte_param_input_17 = 0*2;
  // Collect __xlx_input_18__tmp_vec
std::vector<Byte<2>> __xlx_input_18__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_18__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_18)[i]);
}
  int __xlx_size_param_input_18 = 16;
  int __xlx_offset_param_input_18 = 0;
  int __xlx_offset_byte_param_input_18 = 0*2;
  // Collect __xlx_input_19__tmp_vec
std::vector<Byte<2>> __xlx_input_19__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_19__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_19)[i]);
}
  int __xlx_size_param_input_19 = 16;
  int __xlx_offset_param_input_19 = 0;
  int __xlx_offset_byte_param_input_19 = 0*2;
  // Collect __xlx_input_20__tmp_vec
std::vector<Byte<2>> __xlx_input_20__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_20__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_20)[i]);
}
  int __xlx_size_param_input_20 = 16;
  int __xlx_offset_param_input_20 = 0;
  int __xlx_offset_byte_param_input_20 = 0*2;
  // Collect __xlx_input_21__tmp_vec
std::vector<Byte<2>> __xlx_input_21__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_21__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_21)[i]);
}
  int __xlx_size_param_input_21 = 16;
  int __xlx_offset_param_input_21 = 0;
  int __xlx_offset_byte_param_input_21 = 0*2;
  // Collect __xlx_input_22__tmp_vec
std::vector<Byte<2>> __xlx_input_22__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_22__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_22)[i]);
}
  int __xlx_size_param_input_22 = 16;
  int __xlx_offset_param_input_22 = 0;
  int __xlx_offset_byte_param_input_22 = 0*2;
  // Collect __xlx_input_23__tmp_vec
std::vector<Byte<2>> __xlx_input_23__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_23__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_23)[i]);
}
  int __xlx_size_param_input_23 = 16;
  int __xlx_offset_param_input_23 = 0;
  int __xlx_offset_byte_param_input_23 = 0*2;
  // Collect __xlx_input_24__tmp_vec
std::vector<Byte<2>> __xlx_input_24__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_24__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_24)[i]);
}
  int __xlx_size_param_input_24 = 16;
  int __xlx_offset_param_input_24 = 0;
  int __xlx_offset_byte_param_input_24 = 0*2;
  // Collect __xlx_input_25__tmp_vec
std::vector<Byte<2>> __xlx_input_25__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_25__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_25)[i]);
}
  int __xlx_size_param_input_25 = 16;
  int __xlx_offset_param_input_25 = 0;
  int __xlx_offset_byte_param_input_25 = 0*2;
  // Collect __xlx_input_26__tmp_vec
std::vector<Byte<2>> __xlx_input_26__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_26__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_26)[i]);
}
  int __xlx_size_param_input_26 = 16;
  int __xlx_offset_param_input_26 = 0;
  int __xlx_offset_byte_param_input_26 = 0*2;
  // Collect __xlx_input_27__tmp_vec
std::vector<Byte<2>> __xlx_input_27__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_27__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_27)[i]);
}
  int __xlx_size_param_input_27 = 16;
  int __xlx_offset_param_input_27 = 0;
  int __xlx_offset_byte_param_input_27 = 0*2;
  // Collect __xlx_input_28__tmp_vec
std::vector<Byte<2>> __xlx_input_28__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_28__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_28)[i]);
}
  int __xlx_size_param_input_28 = 16;
  int __xlx_offset_param_input_28 = 0;
  int __xlx_offset_byte_param_input_28 = 0*2;
  // Collect __xlx_input_29__tmp_vec
std::vector<Byte<2>> __xlx_input_29__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_29__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_29)[i]);
}
  int __xlx_size_param_input_29 = 16;
  int __xlx_offset_param_input_29 = 0;
  int __xlx_offset_byte_param_input_29 = 0*2;
  // Collect __xlx_input_30__tmp_vec
std::vector<Byte<2>> __xlx_input_30__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_30__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_30)[i]);
}
  int __xlx_size_param_input_30 = 16;
  int __xlx_offset_param_input_30 = 0;
  int __xlx_offset_byte_param_input_30 = 0*2;
  // Collect __xlx_input_31__tmp_vec
std::vector<Byte<2>> __xlx_input_31__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_31__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_31)[i]);
}
  int __xlx_size_param_input_31 = 16;
  int __xlx_offset_param_input_31 = 0;
  int __xlx_offset_byte_param_input_31 = 0*2;
  // Collect __xlx_input_32__tmp_vec
std::vector<Byte<2>> __xlx_input_32__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_32__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_32)[i]);
}
  int __xlx_size_param_input_32 = 16;
  int __xlx_offset_param_input_32 = 0;
  int __xlx_offset_byte_param_input_32 = 0*2;
  // Collect __xlx_input_33__tmp_vec
std::vector<Byte<2>> __xlx_input_33__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_33__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_33)[i]);
}
  int __xlx_size_param_input_33 = 16;
  int __xlx_offset_param_input_33 = 0;
  int __xlx_offset_byte_param_input_33 = 0*2;
  // Collect __xlx_input_34__tmp_vec
std::vector<Byte<2>> __xlx_input_34__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_34__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_34)[i]);
}
  int __xlx_size_param_input_34 = 16;
  int __xlx_offset_param_input_34 = 0;
  int __xlx_offset_byte_param_input_34 = 0*2;
  // Collect __xlx_input_35__tmp_vec
std::vector<Byte<2>> __xlx_input_35__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_35__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_35)[i]);
}
  int __xlx_size_param_input_35 = 16;
  int __xlx_offset_param_input_35 = 0;
  int __xlx_offset_byte_param_input_35 = 0*2;
  // Collect __xlx_input_36__tmp_vec
std::vector<Byte<2>> __xlx_input_36__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_36__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_36)[i]);
}
  int __xlx_size_param_input_36 = 16;
  int __xlx_offset_param_input_36 = 0;
  int __xlx_offset_byte_param_input_36 = 0*2;
  // Collect __xlx_input_37__tmp_vec
std::vector<Byte<2>> __xlx_input_37__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_37__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_37)[i]);
}
  int __xlx_size_param_input_37 = 16;
  int __xlx_offset_param_input_37 = 0;
  int __xlx_offset_byte_param_input_37 = 0*2;
  // Collect __xlx_input_38__tmp_vec
std::vector<Byte<2>> __xlx_input_38__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_38__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_38)[i]);
}
  int __xlx_size_param_input_38 = 16;
  int __xlx_offset_param_input_38 = 0;
  int __xlx_offset_byte_param_input_38 = 0*2;
  // Collect __xlx_input_39__tmp_vec
std::vector<Byte<2>> __xlx_input_39__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_39__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_39)[i]);
}
  int __xlx_size_param_input_39 = 16;
  int __xlx_offset_param_input_39 = 0;
  int __xlx_offset_byte_param_input_39 = 0*2;
  // Collect __xlx_input_40__tmp_vec
std::vector<Byte<2>> __xlx_input_40__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_40__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_40)[i]);
}
  int __xlx_size_param_input_40 = 16;
  int __xlx_offset_param_input_40 = 0;
  int __xlx_offset_byte_param_input_40 = 0*2;
  // Collect __xlx_input_41__tmp_vec
std::vector<Byte<2>> __xlx_input_41__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_41__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_41)[i]);
}
  int __xlx_size_param_input_41 = 16;
  int __xlx_offset_param_input_41 = 0;
  int __xlx_offset_byte_param_input_41 = 0*2;
  // Collect __xlx_input_42__tmp_vec
std::vector<Byte<2>> __xlx_input_42__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_42__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_42)[i]);
}
  int __xlx_size_param_input_42 = 16;
  int __xlx_offset_param_input_42 = 0;
  int __xlx_offset_byte_param_input_42 = 0*2;
  // Collect __xlx_input_43__tmp_vec
std::vector<Byte<2>> __xlx_input_43__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_43__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_43)[i]);
}
  int __xlx_size_param_input_43 = 16;
  int __xlx_offset_param_input_43 = 0;
  int __xlx_offset_byte_param_input_43 = 0*2;
  // Collect __xlx_input_44__tmp_vec
std::vector<Byte<2>> __xlx_input_44__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_44__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_44)[i]);
}
  int __xlx_size_param_input_44 = 16;
  int __xlx_offset_param_input_44 = 0;
  int __xlx_offset_byte_param_input_44 = 0*2;
  // Collect __xlx_input_45__tmp_vec
std::vector<Byte<2>> __xlx_input_45__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_45__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_45)[i]);
}
  int __xlx_size_param_input_45 = 16;
  int __xlx_offset_param_input_45 = 0;
  int __xlx_offset_byte_param_input_45 = 0*2;
  // Collect __xlx_input_46__tmp_vec
std::vector<Byte<2>> __xlx_input_46__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_46__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_46)[i]);
}
  int __xlx_size_param_input_46 = 16;
  int __xlx_offset_param_input_46 = 0;
  int __xlx_offset_byte_param_input_46 = 0*2;
  // Collect __xlx_input_47__tmp_vec
std::vector<Byte<2>> __xlx_input_47__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_47__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_47)[i]);
}
  int __xlx_size_param_input_47 = 16;
  int __xlx_offset_param_input_47 = 0;
  int __xlx_offset_byte_param_input_47 = 0*2;
  // Collect __xlx_input_48__tmp_vec
std::vector<Byte<2>> __xlx_input_48__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_48__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_48)[i]);
}
  int __xlx_size_param_input_48 = 16;
  int __xlx_offset_param_input_48 = 0;
  int __xlx_offset_byte_param_input_48 = 0*2;
  // Collect __xlx_input_49__tmp_vec
std::vector<Byte<2>> __xlx_input_49__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_49__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_49)[i]);
}
  int __xlx_size_param_input_49 = 16;
  int __xlx_offset_param_input_49 = 0;
  int __xlx_offset_byte_param_input_49 = 0*2;
  // Collect __xlx_input_50__tmp_vec
std::vector<Byte<2>> __xlx_input_50__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_50__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_50)[i]);
}
  int __xlx_size_param_input_50 = 16;
  int __xlx_offset_param_input_50 = 0;
  int __xlx_offset_byte_param_input_50 = 0*2;
  // Collect __xlx_input_51__tmp_vec
std::vector<Byte<2>> __xlx_input_51__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_51__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_51)[i]);
}
  int __xlx_size_param_input_51 = 16;
  int __xlx_offset_param_input_51 = 0;
  int __xlx_offset_byte_param_input_51 = 0*2;
  // Collect __xlx_input_52__tmp_vec
std::vector<Byte<2>> __xlx_input_52__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_52__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_52)[i]);
}
  int __xlx_size_param_input_52 = 16;
  int __xlx_offset_param_input_52 = 0;
  int __xlx_offset_byte_param_input_52 = 0*2;
  // Collect __xlx_input_53__tmp_vec
std::vector<Byte<2>> __xlx_input_53__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_53__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_53)[i]);
}
  int __xlx_size_param_input_53 = 16;
  int __xlx_offset_param_input_53 = 0;
  int __xlx_offset_byte_param_input_53 = 0*2;
  // Collect __xlx_input_54__tmp_vec
std::vector<Byte<2>> __xlx_input_54__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_54__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_54)[i]);
}
  int __xlx_size_param_input_54 = 16;
  int __xlx_offset_param_input_54 = 0;
  int __xlx_offset_byte_param_input_54 = 0*2;
  // Collect __xlx_input_55__tmp_vec
std::vector<Byte<2>> __xlx_input_55__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_55__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_55)[i]);
}
  int __xlx_size_param_input_55 = 16;
  int __xlx_offset_param_input_55 = 0;
  int __xlx_offset_byte_param_input_55 = 0*2;
  // Collect __xlx_input_56__tmp_vec
std::vector<Byte<2>> __xlx_input_56__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_56__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_56)[i]);
}
  int __xlx_size_param_input_56 = 16;
  int __xlx_offset_param_input_56 = 0;
  int __xlx_offset_byte_param_input_56 = 0*2;
  // Collect __xlx_input_57__tmp_vec
std::vector<Byte<2>> __xlx_input_57__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_57__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_57)[i]);
}
  int __xlx_size_param_input_57 = 16;
  int __xlx_offset_param_input_57 = 0;
  int __xlx_offset_byte_param_input_57 = 0*2;
  // Collect __xlx_input_58__tmp_vec
std::vector<Byte<2>> __xlx_input_58__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_58__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_58)[i]);
}
  int __xlx_size_param_input_58 = 16;
  int __xlx_offset_param_input_58 = 0;
  int __xlx_offset_byte_param_input_58 = 0*2;
  // Collect __xlx_input_59__tmp_vec
std::vector<Byte<2>> __xlx_input_59__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_59__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_59)[i]);
}
  int __xlx_size_param_input_59 = 16;
  int __xlx_offset_param_input_59 = 0;
  int __xlx_offset_byte_param_input_59 = 0*2;
  // Collect __xlx_input_60__tmp_vec
std::vector<Byte<2>> __xlx_input_60__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_60__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_60)[i]);
}
  int __xlx_size_param_input_60 = 16;
  int __xlx_offset_param_input_60 = 0;
  int __xlx_offset_byte_param_input_60 = 0*2;
  // Collect __xlx_input_61__tmp_vec
std::vector<Byte<2>> __xlx_input_61__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_61__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_61)[i]);
}
  int __xlx_size_param_input_61 = 16;
  int __xlx_offset_param_input_61 = 0;
  int __xlx_offset_byte_param_input_61 = 0*2;
  // Collect __xlx_input_62__tmp_vec
std::vector<Byte<2>> __xlx_input_62__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_62__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_62)[i]);
}
  int __xlx_size_param_input_62 = 16;
  int __xlx_offset_param_input_62 = 0;
  int __xlx_offset_byte_param_input_62 = 0*2;
  // Collect __xlx_input_63__tmp_vec
std::vector<Byte<2>> __xlx_input_63__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_input_63__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_input_63)[i]);
}
  int __xlx_size_param_input_63 = 16;
  int __xlx_offset_param_input_63 = 0;
  int __xlx_offset_byte_param_input_63 = 0*2;
  // DUT call
  imgds_linear_dense_q16(__xlx_input_0__tmp_vec.data(), __xlx_input_1__tmp_vec.data(), __xlx_input_2__tmp_vec.data(), __xlx_input_3__tmp_vec.data(), __xlx_input_4__tmp_vec.data(), __xlx_input_5__tmp_vec.data(), __xlx_input_6__tmp_vec.data(), __xlx_input_7__tmp_vec.data(), __xlx_input_8__tmp_vec.data(), __xlx_input_9__tmp_vec.data(), __xlx_input_10__tmp_vec.data(), __xlx_input_11__tmp_vec.data(), __xlx_input_12__tmp_vec.data(), __xlx_input_13__tmp_vec.data(), __xlx_input_14__tmp_vec.data(), __xlx_input_15__tmp_vec.data(), __xlx_input_16__tmp_vec.data(), __xlx_input_17__tmp_vec.data(), __xlx_input_18__tmp_vec.data(), __xlx_input_19__tmp_vec.data(), __xlx_input_20__tmp_vec.data(), __xlx_input_21__tmp_vec.data(), __xlx_input_22__tmp_vec.data(), __xlx_input_23__tmp_vec.data(), __xlx_input_24__tmp_vec.data(), __xlx_input_25__tmp_vec.data(), __xlx_input_26__tmp_vec.data(), __xlx_input_27__tmp_vec.data(), __xlx_input_28__tmp_vec.data(), __xlx_input_29__tmp_vec.data(), __xlx_input_30__tmp_vec.data(), __xlx_input_31__tmp_vec.data(), __xlx_input_32__tmp_vec.data(), __xlx_input_33__tmp_vec.data(), __xlx_input_34__tmp_vec.data(), __xlx_input_35__tmp_vec.data(), __xlx_input_36__tmp_vec.data(), __xlx_input_37__tmp_vec.data(), __xlx_input_38__tmp_vec.data(), __xlx_input_39__tmp_vec.data(), __xlx_input_40__tmp_vec.data(), __xlx_input_41__tmp_vec.data(), __xlx_input_42__tmp_vec.data(), __xlx_input_43__tmp_vec.data(), __xlx_input_44__tmp_vec.data(), __xlx_input_45__tmp_vec.data(), __xlx_input_46__tmp_vec.data(), __xlx_input_47__tmp_vec.data(), __xlx_input_48__tmp_vec.data(), __xlx_input_49__tmp_vec.data(), __xlx_input_50__tmp_vec.data(), __xlx_input_51__tmp_vec.data(), __xlx_input_52__tmp_vec.data(), __xlx_input_53__tmp_vec.data(), __xlx_input_54__tmp_vec.data(), __xlx_input_55__tmp_vec.data(), __xlx_input_56__tmp_vec.data(), __xlx_input_57__tmp_vec.data(), __xlx_input_58__tmp_vec.data(), __xlx_input_59__tmp_vec.data(), __xlx_input_60__tmp_vec.data(), __xlx_input_61__tmp_vec.data(), __xlx_input_62__tmp_vec.data(), __xlx_input_63__tmp_vec.data(), __xlx_apatb_param_logits_0, __xlx_apatb_param_logits_1);
// print __xlx_apatb_param_input_0
for (size_t i = 0; i < __xlx_size_param_input_0; ++i) {
((Byte<2>*)__xlx_apatb_param_input_0)[i] = __xlx_input_0__tmp_vec[__xlx_offset_param_input_0+i];
}
// print __xlx_apatb_param_input_1
for (size_t i = 0; i < __xlx_size_param_input_1; ++i) {
((Byte<2>*)__xlx_apatb_param_input_1)[i] = __xlx_input_1__tmp_vec[__xlx_offset_param_input_1+i];
}
// print __xlx_apatb_param_input_2
for (size_t i = 0; i < __xlx_size_param_input_2; ++i) {
((Byte<2>*)__xlx_apatb_param_input_2)[i] = __xlx_input_2__tmp_vec[__xlx_offset_param_input_2+i];
}
// print __xlx_apatb_param_input_3
for (size_t i = 0; i < __xlx_size_param_input_3; ++i) {
((Byte<2>*)__xlx_apatb_param_input_3)[i] = __xlx_input_3__tmp_vec[__xlx_offset_param_input_3+i];
}
// print __xlx_apatb_param_input_4
for (size_t i = 0; i < __xlx_size_param_input_4; ++i) {
((Byte<2>*)__xlx_apatb_param_input_4)[i] = __xlx_input_4__tmp_vec[__xlx_offset_param_input_4+i];
}
// print __xlx_apatb_param_input_5
for (size_t i = 0; i < __xlx_size_param_input_5; ++i) {
((Byte<2>*)__xlx_apatb_param_input_5)[i] = __xlx_input_5__tmp_vec[__xlx_offset_param_input_5+i];
}
// print __xlx_apatb_param_input_6
for (size_t i = 0; i < __xlx_size_param_input_6; ++i) {
((Byte<2>*)__xlx_apatb_param_input_6)[i] = __xlx_input_6__tmp_vec[__xlx_offset_param_input_6+i];
}
// print __xlx_apatb_param_input_7
for (size_t i = 0; i < __xlx_size_param_input_7; ++i) {
((Byte<2>*)__xlx_apatb_param_input_7)[i] = __xlx_input_7__tmp_vec[__xlx_offset_param_input_7+i];
}
// print __xlx_apatb_param_input_8
for (size_t i = 0; i < __xlx_size_param_input_8; ++i) {
((Byte<2>*)__xlx_apatb_param_input_8)[i] = __xlx_input_8__tmp_vec[__xlx_offset_param_input_8+i];
}
// print __xlx_apatb_param_input_9
for (size_t i = 0; i < __xlx_size_param_input_9; ++i) {
((Byte<2>*)__xlx_apatb_param_input_9)[i] = __xlx_input_9__tmp_vec[__xlx_offset_param_input_9+i];
}
// print __xlx_apatb_param_input_10
for (size_t i = 0; i < __xlx_size_param_input_10; ++i) {
((Byte<2>*)__xlx_apatb_param_input_10)[i] = __xlx_input_10__tmp_vec[__xlx_offset_param_input_10+i];
}
// print __xlx_apatb_param_input_11
for (size_t i = 0; i < __xlx_size_param_input_11; ++i) {
((Byte<2>*)__xlx_apatb_param_input_11)[i] = __xlx_input_11__tmp_vec[__xlx_offset_param_input_11+i];
}
// print __xlx_apatb_param_input_12
for (size_t i = 0; i < __xlx_size_param_input_12; ++i) {
((Byte<2>*)__xlx_apatb_param_input_12)[i] = __xlx_input_12__tmp_vec[__xlx_offset_param_input_12+i];
}
// print __xlx_apatb_param_input_13
for (size_t i = 0; i < __xlx_size_param_input_13; ++i) {
((Byte<2>*)__xlx_apatb_param_input_13)[i] = __xlx_input_13__tmp_vec[__xlx_offset_param_input_13+i];
}
// print __xlx_apatb_param_input_14
for (size_t i = 0; i < __xlx_size_param_input_14; ++i) {
((Byte<2>*)__xlx_apatb_param_input_14)[i] = __xlx_input_14__tmp_vec[__xlx_offset_param_input_14+i];
}
// print __xlx_apatb_param_input_15
for (size_t i = 0; i < __xlx_size_param_input_15; ++i) {
((Byte<2>*)__xlx_apatb_param_input_15)[i] = __xlx_input_15__tmp_vec[__xlx_offset_param_input_15+i];
}
// print __xlx_apatb_param_input_16
for (size_t i = 0; i < __xlx_size_param_input_16; ++i) {
((Byte<2>*)__xlx_apatb_param_input_16)[i] = __xlx_input_16__tmp_vec[__xlx_offset_param_input_16+i];
}
// print __xlx_apatb_param_input_17
for (size_t i = 0; i < __xlx_size_param_input_17; ++i) {
((Byte<2>*)__xlx_apatb_param_input_17)[i] = __xlx_input_17__tmp_vec[__xlx_offset_param_input_17+i];
}
// print __xlx_apatb_param_input_18
for (size_t i = 0; i < __xlx_size_param_input_18; ++i) {
((Byte<2>*)__xlx_apatb_param_input_18)[i] = __xlx_input_18__tmp_vec[__xlx_offset_param_input_18+i];
}
// print __xlx_apatb_param_input_19
for (size_t i = 0; i < __xlx_size_param_input_19; ++i) {
((Byte<2>*)__xlx_apatb_param_input_19)[i] = __xlx_input_19__tmp_vec[__xlx_offset_param_input_19+i];
}
// print __xlx_apatb_param_input_20
for (size_t i = 0; i < __xlx_size_param_input_20; ++i) {
((Byte<2>*)__xlx_apatb_param_input_20)[i] = __xlx_input_20__tmp_vec[__xlx_offset_param_input_20+i];
}
// print __xlx_apatb_param_input_21
for (size_t i = 0; i < __xlx_size_param_input_21; ++i) {
((Byte<2>*)__xlx_apatb_param_input_21)[i] = __xlx_input_21__tmp_vec[__xlx_offset_param_input_21+i];
}
// print __xlx_apatb_param_input_22
for (size_t i = 0; i < __xlx_size_param_input_22; ++i) {
((Byte<2>*)__xlx_apatb_param_input_22)[i] = __xlx_input_22__tmp_vec[__xlx_offset_param_input_22+i];
}
// print __xlx_apatb_param_input_23
for (size_t i = 0; i < __xlx_size_param_input_23; ++i) {
((Byte<2>*)__xlx_apatb_param_input_23)[i] = __xlx_input_23__tmp_vec[__xlx_offset_param_input_23+i];
}
// print __xlx_apatb_param_input_24
for (size_t i = 0; i < __xlx_size_param_input_24; ++i) {
((Byte<2>*)__xlx_apatb_param_input_24)[i] = __xlx_input_24__tmp_vec[__xlx_offset_param_input_24+i];
}
// print __xlx_apatb_param_input_25
for (size_t i = 0; i < __xlx_size_param_input_25; ++i) {
((Byte<2>*)__xlx_apatb_param_input_25)[i] = __xlx_input_25__tmp_vec[__xlx_offset_param_input_25+i];
}
// print __xlx_apatb_param_input_26
for (size_t i = 0; i < __xlx_size_param_input_26; ++i) {
((Byte<2>*)__xlx_apatb_param_input_26)[i] = __xlx_input_26__tmp_vec[__xlx_offset_param_input_26+i];
}
// print __xlx_apatb_param_input_27
for (size_t i = 0; i < __xlx_size_param_input_27; ++i) {
((Byte<2>*)__xlx_apatb_param_input_27)[i] = __xlx_input_27__tmp_vec[__xlx_offset_param_input_27+i];
}
// print __xlx_apatb_param_input_28
for (size_t i = 0; i < __xlx_size_param_input_28; ++i) {
((Byte<2>*)__xlx_apatb_param_input_28)[i] = __xlx_input_28__tmp_vec[__xlx_offset_param_input_28+i];
}
// print __xlx_apatb_param_input_29
for (size_t i = 0; i < __xlx_size_param_input_29; ++i) {
((Byte<2>*)__xlx_apatb_param_input_29)[i] = __xlx_input_29__tmp_vec[__xlx_offset_param_input_29+i];
}
// print __xlx_apatb_param_input_30
for (size_t i = 0; i < __xlx_size_param_input_30; ++i) {
((Byte<2>*)__xlx_apatb_param_input_30)[i] = __xlx_input_30__tmp_vec[__xlx_offset_param_input_30+i];
}
// print __xlx_apatb_param_input_31
for (size_t i = 0; i < __xlx_size_param_input_31; ++i) {
((Byte<2>*)__xlx_apatb_param_input_31)[i] = __xlx_input_31__tmp_vec[__xlx_offset_param_input_31+i];
}
// print __xlx_apatb_param_input_32
for (size_t i = 0; i < __xlx_size_param_input_32; ++i) {
((Byte<2>*)__xlx_apatb_param_input_32)[i] = __xlx_input_32__tmp_vec[__xlx_offset_param_input_32+i];
}
// print __xlx_apatb_param_input_33
for (size_t i = 0; i < __xlx_size_param_input_33; ++i) {
((Byte<2>*)__xlx_apatb_param_input_33)[i] = __xlx_input_33__tmp_vec[__xlx_offset_param_input_33+i];
}
// print __xlx_apatb_param_input_34
for (size_t i = 0; i < __xlx_size_param_input_34; ++i) {
((Byte<2>*)__xlx_apatb_param_input_34)[i] = __xlx_input_34__tmp_vec[__xlx_offset_param_input_34+i];
}
// print __xlx_apatb_param_input_35
for (size_t i = 0; i < __xlx_size_param_input_35; ++i) {
((Byte<2>*)__xlx_apatb_param_input_35)[i] = __xlx_input_35__tmp_vec[__xlx_offset_param_input_35+i];
}
// print __xlx_apatb_param_input_36
for (size_t i = 0; i < __xlx_size_param_input_36; ++i) {
((Byte<2>*)__xlx_apatb_param_input_36)[i] = __xlx_input_36__tmp_vec[__xlx_offset_param_input_36+i];
}
// print __xlx_apatb_param_input_37
for (size_t i = 0; i < __xlx_size_param_input_37; ++i) {
((Byte<2>*)__xlx_apatb_param_input_37)[i] = __xlx_input_37__tmp_vec[__xlx_offset_param_input_37+i];
}
// print __xlx_apatb_param_input_38
for (size_t i = 0; i < __xlx_size_param_input_38; ++i) {
((Byte<2>*)__xlx_apatb_param_input_38)[i] = __xlx_input_38__tmp_vec[__xlx_offset_param_input_38+i];
}
// print __xlx_apatb_param_input_39
for (size_t i = 0; i < __xlx_size_param_input_39; ++i) {
((Byte<2>*)__xlx_apatb_param_input_39)[i] = __xlx_input_39__tmp_vec[__xlx_offset_param_input_39+i];
}
// print __xlx_apatb_param_input_40
for (size_t i = 0; i < __xlx_size_param_input_40; ++i) {
((Byte<2>*)__xlx_apatb_param_input_40)[i] = __xlx_input_40__tmp_vec[__xlx_offset_param_input_40+i];
}
// print __xlx_apatb_param_input_41
for (size_t i = 0; i < __xlx_size_param_input_41; ++i) {
((Byte<2>*)__xlx_apatb_param_input_41)[i] = __xlx_input_41__tmp_vec[__xlx_offset_param_input_41+i];
}
// print __xlx_apatb_param_input_42
for (size_t i = 0; i < __xlx_size_param_input_42; ++i) {
((Byte<2>*)__xlx_apatb_param_input_42)[i] = __xlx_input_42__tmp_vec[__xlx_offset_param_input_42+i];
}
// print __xlx_apatb_param_input_43
for (size_t i = 0; i < __xlx_size_param_input_43; ++i) {
((Byte<2>*)__xlx_apatb_param_input_43)[i] = __xlx_input_43__tmp_vec[__xlx_offset_param_input_43+i];
}
// print __xlx_apatb_param_input_44
for (size_t i = 0; i < __xlx_size_param_input_44; ++i) {
((Byte<2>*)__xlx_apatb_param_input_44)[i] = __xlx_input_44__tmp_vec[__xlx_offset_param_input_44+i];
}
// print __xlx_apatb_param_input_45
for (size_t i = 0; i < __xlx_size_param_input_45; ++i) {
((Byte<2>*)__xlx_apatb_param_input_45)[i] = __xlx_input_45__tmp_vec[__xlx_offset_param_input_45+i];
}
// print __xlx_apatb_param_input_46
for (size_t i = 0; i < __xlx_size_param_input_46; ++i) {
((Byte<2>*)__xlx_apatb_param_input_46)[i] = __xlx_input_46__tmp_vec[__xlx_offset_param_input_46+i];
}
// print __xlx_apatb_param_input_47
for (size_t i = 0; i < __xlx_size_param_input_47; ++i) {
((Byte<2>*)__xlx_apatb_param_input_47)[i] = __xlx_input_47__tmp_vec[__xlx_offset_param_input_47+i];
}
// print __xlx_apatb_param_input_48
for (size_t i = 0; i < __xlx_size_param_input_48; ++i) {
((Byte<2>*)__xlx_apatb_param_input_48)[i] = __xlx_input_48__tmp_vec[__xlx_offset_param_input_48+i];
}
// print __xlx_apatb_param_input_49
for (size_t i = 0; i < __xlx_size_param_input_49; ++i) {
((Byte<2>*)__xlx_apatb_param_input_49)[i] = __xlx_input_49__tmp_vec[__xlx_offset_param_input_49+i];
}
// print __xlx_apatb_param_input_50
for (size_t i = 0; i < __xlx_size_param_input_50; ++i) {
((Byte<2>*)__xlx_apatb_param_input_50)[i] = __xlx_input_50__tmp_vec[__xlx_offset_param_input_50+i];
}
// print __xlx_apatb_param_input_51
for (size_t i = 0; i < __xlx_size_param_input_51; ++i) {
((Byte<2>*)__xlx_apatb_param_input_51)[i] = __xlx_input_51__tmp_vec[__xlx_offset_param_input_51+i];
}
// print __xlx_apatb_param_input_52
for (size_t i = 0; i < __xlx_size_param_input_52; ++i) {
((Byte<2>*)__xlx_apatb_param_input_52)[i] = __xlx_input_52__tmp_vec[__xlx_offset_param_input_52+i];
}
// print __xlx_apatb_param_input_53
for (size_t i = 0; i < __xlx_size_param_input_53; ++i) {
((Byte<2>*)__xlx_apatb_param_input_53)[i] = __xlx_input_53__tmp_vec[__xlx_offset_param_input_53+i];
}
// print __xlx_apatb_param_input_54
for (size_t i = 0; i < __xlx_size_param_input_54; ++i) {
((Byte<2>*)__xlx_apatb_param_input_54)[i] = __xlx_input_54__tmp_vec[__xlx_offset_param_input_54+i];
}
// print __xlx_apatb_param_input_55
for (size_t i = 0; i < __xlx_size_param_input_55; ++i) {
((Byte<2>*)__xlx_apatb_param_input_55)[i] = __xlx_input_55__tmp_vec[__xlx_offset_param_input_55+i];
}
// print __xlx_apatb_param_input_56
for (size_t i = 0; i < __xlx_size_param_input_56; ++i) {
((Byte<2>*)__xlx_apatb_param_input_56)[i] = __xlx_input_56__tmp_vec[__xlx_offset_param_input_56+i];
}
// print __xlx_apatb_param_input_57
for (size_t i = 0; i < __xlx_size_param_input_57; ++i) {
((Byte<2>*)__xlx_apatb_param_input_57)[i] = __xlx_input_57__tmp_vec[__xlx_offset_param_input_57+i];
}
// print __xlx_apatb_param_input_58
for (size_t i = 0; i < __xlx_size_param_input_58; ++i) {
((Byte<2>*)__xlx_apatb_param_input_58)[i] = __xlx_input_58__tmp_vec[__xlx_offset_param_input_58+i];
}
// print __xlx_apatb_param_input_59
for (size_t i = 0; i < __xlx_size_param_input_59; ++i) {
((Byte<2>*)__xlx_apatb_param_input_59)[i] = __xlx_input_59__tmp_vec[__xlx_offset_param_input_59+i];
}
// print __xlx_apatb_param_input_60
for (size_t i = 0; i < __xlx_size_param_input_60; ++i) {
((Byte<2>*)__xlx_apatb_param_input_60)[i] = __xlx_input_60__tmp_vec[__xlx_offset_param_input_60+i];
}
// print __xlx_apatb_param_input_61
for (size_t i = 0; i < __xlx_size_param_input_61; ++i) {
((Byte<2>*)__xlx_apatb_param_input_61)[i] = __xlx_input_61__tmp_vec[__xlx_offset_param_input_61+i];
}
// print __xlx_apatb_param_input_62
for (size_t i = 0; i < __xlx_size_param_input_62; ++i) {
((Byte<2>*)__xlx_apatb_param_input_62)[i] = __xlx_input_62__tmp_vec[__xlx_offset_param_input_62+i];
}
// print __xlx_apatb_param_input_63
for (size_t i = 0; i < __xlx_size_param_input_63; ++i) {
((Byte<2>*)__xlx_apatb_param_input_63)[i] = __xlx_input_63__tmp_vec[__xlx_offset_param_input_63+i];
}
}
