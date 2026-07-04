#include <algorithm>
#include <complex>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <exception>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include "ap_fixed.h"
#include "ap_int.h"
#include "autopilot_cbe.h"
#include "hls_half.h"
#include "hls_signal_handler.h"
#include "hls_stream.h"

using namespace std;

// wrapc file define:
#define AUTOTB_TVIN_input_0 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_0.dat"
#define AUTOTB_TVOUT_input_0 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_0.dat"
#define AUTOTB_TVIN_input_1 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_1.dat"
#define AUTOTB_TVOUT_input_1 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_1.dat"
#define AUTOTB_TVIN_input_2 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_2.dat"
#define AUTOTB_TVOUT_input_2 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_2.dat"
#define AUTOTB_TVIN_input_3 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_3.dat"
#define AUTOTB_TVOUT_input_3 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_3.dat"
#define AUTOTB_TVIN_input_4 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_4.dat"
#define AUTOTB_TVOUT_input_4 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_4.dat"
#define AUTOTB_TVIN_input_5 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_5.dat"
#define AUTOTB_TVOUT_input_5 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_5.dat"
#define AUTOTB_TVIN_input_6 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_6.dat"
#define AUTOTB_TVOUT_input_6 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_6.dat"
#define AUTOTB_TVIN_input_7 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_7.dat"
#define AUTOTB_TVOUT_input_7 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_7.dat"
#define AUTOTB_TVIN_input_8 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_8.dat"
#define AUTOTB_TVOUT_input_8 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_8.dat"
#define AUTOTB_TVIN_input_9 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_9.dat"
#define AUTOTB_TVOUT_input_9 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_9.dat"
#define AUTOTB_TVIN_input_10 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_10.dat"
#define AUTOTB_TVOUT_input_10 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_10.dat"
#define AUTOTB_TVIN_input_11 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_11.dat"
#define AUTOTB_TVOUT_input_11 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_11.dat"
#define AUTOTB_TVIN_input_12 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_12.dat"
#define AUTOTB_TVOUT_input_12 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_12.dat"
#define AUTOTB_TVIN_input_13 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_13.dat"
#define AUTOTB_TVOUT_input_13 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_13.dat"
#define AUTOTB_TVIN_input_14 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_14.dat"
#define AUTOTB_TVOUT_input_14 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_14.dat"
#define AUTOTB_TVIN_input_15 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_15.dat"
#define AUTOTB_TVOUT_input_15 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_15.dat"
#define AUTOTB_TVIN_input_16 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_16.dat"
#define AUTOTB_TVOUT_input_16 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_16.dat"
#define AUTOTB_TVIN_input_17 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_17.dat"
#define AUTOTB_TVOUT_input_17 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_17.dat"
#define AUTOTB_TVIN_input_18 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_18.dat"
#define AUTOTB_TVOUT_input_18 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_18.dat"
#define AUTOTB_TVIN_input_19 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_19.dat"
#define AUTOTB_TVOUT_input_19 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_19.dat"
#define AUTOTB_TVIN_input_20 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_20.dat"
#define AUTOTB_TVOUT_input_20 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_20.dat"
#define AUTOTB_TVIN_input_21 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_21.dat"
#define AUTOTB_TVOUT_input_21 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_21.dat"
#define AUTOTB_TVIN_input_22 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_22.dat"
#define AUTOTB_TVOUT_input_22 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_22.dat"
#define AUTOTB_TVIN_input_23 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_23.dat"
#define AUTOTB_TVOUT_input_23 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_23.dat"
#define AUTOTB_TVIN_input_24 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_24.dat"
#define AUTOTB_TVOUT_input_24 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_24.dat"
#define AUTOTB_TVIN_input_25 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_25.dat"
#define AUTOTB_TVOUT_input_25 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_25.dat"
#define AUTOTB_TVIN_input_26 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_26.dat"
#define AUTOTB_TVOUT_input_26 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_26.dat"
#define AUTOTB_TVIN_input_27 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_27.dat"
#define AUTOTB_TVOUT_input_27 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_27.dat"
#define AUTOTB_TVIN_input_28 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_28.dat"
#define AUTOTB_TVOUT_input_28 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_28.dat"
#define AUTOTB_TVIN_input_29 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_29.dat"
#define AUTOTB_TVOUT_input_29 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_29.dat"
#define AUTOTB_TVIN_input_30 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_30.dat"
#define AUTOTB_TVOUT_input_30 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_30.dat"
#define AUTOTB_TVIN_input_31 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_31.dat"
#define AUTOTB_TVOUT_input_31 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_31.dat"
#define AUTOTB_TVIN_input_32 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_32.dat"
#define AUTOTB_TVOUT_input_32 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_32.dat"
#define AUTOTB_TVIN_input_33 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_33.dat"
#define AUTOTB_TVOUT_input_33 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_33.dat"
#define AUTOTB_TVIN_input_34 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_34.dat"
#define AUTOTB_TVOUT_input_34 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_34.dat"
#define AUTOTB_TVIN_input_35 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_35.dat"
#define AUTOTB_TVOUT_input_35 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_35.dat"
#define AUTOTB_TVIN_input_36 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_36.dat"
#define AUTOTB_TVOUT_input_36 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_36.dat"
#define AUTOTB_TVIN_input_37 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_37.dat"
#define AUTOTB_TVOUT_input_37 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_37.dat"
#define AUTOTB_TVIN_input_38 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_38.dat"
#define AUTOTB_TVOUT_input_38 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_38.dat"
#define AUTOTB_TVIN_input_39 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_39.dat"
#define AUTOTB_TVOUT_input_39 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_39.dat"
#define AUTOTB_TVIN_input_40 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_40.dat"
#define AUTOTB_TVOUT_input_40 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_40.dat"
#define AUTOTB_TVIN_input_41 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_41.dat"
#define AUTOTB_TVOUT_input_41 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_41.dat"
#define AUTOTB_TVIN_input_42 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_42.dat"
#define AUTOTB_TVOUT_input_42 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_42.dat"
#define AUTOTB_TVIN_input_43 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_43.dat"
#define AUTOTB_TVOUT_input_43 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_43.dat"
#define AUTOTB_TVIN_input_44 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_44.dat"
#define AUTOTB_TVOUT_input_44 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_44.dat"
#define AUTOTB_TVIN_input_45 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_45.dat"
#define AUTOTB_TVOUT_input_45 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_45.dat"
#define AUTOTB_TVIN_input_46 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_46.dat"
#define AUTOTB_TVOUT_input_46 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_46.dat"
#define AUTOTB_TVIN_input_47 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_47.dat"
#define AUTOTB_TVOUT_input_47 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_47.dat"
#define AUTOTB_TVIN_input_48 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_48.dat"
#define AUTOTB_TVOUT_input_48 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_48.dat"
#define AUTOTB_TVIN_input_49 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_49.dat"
#define AUTOTB_TVOUT_input_49 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_49.dat"
#define AUTOTB_TVIN_input_50 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_50.dat"
#define AUTOTB_TVOUT_input_50 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_50.dat"
#define AUTOTB_TVIN_input_51 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_51.dat"
#define AUTOTB_TVOUT_input_51 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_51.dat"
#define AUTOTB_TVIN_input_52 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_52.dat"
#define AUTOTB_TVOUT_input_52 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_52.dat"
#define AUTOTB_TVIN_input_53 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_53.dat"
#define AUTOTB_TVOUT_input_53 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_53.dat"
#define AUTOTB_TVIN_input_54 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_54.dat"
#define AUTOTB_TVOUT_input_54 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_54.dat"
#define AUTOTB_TVIN_input_55 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_55.dat"
#define AUTOTB_TVOUT_input_55 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_55.dat"
#define AUTOTB_TVIN_input_56 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_56.dat"
#define AUTOTB_TVOUT_input_56 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_56.dat"
#define AUTOTB_TVIN_input_57 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_57.dat"
#define AUTOTB_TVOUT_input_57 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_57.dat"
#define AUTOTB_TVIN_input_58 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_58.dat"
#define AUTOTB_TVOUT_input_58 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_58.dat"
#define AUTOTB_TVIN_input_59 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_59.dat"
#define AUTOTB_TVOUT_input_59 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_59.dat"
#define AUTOTB_TVIN_input_60 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_60.dat"
#define AUTOTB_TVOUT_input_60 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_60.dat"
#define AUTOTB_TVIN_input_61 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_61.dat"
#define AUTOTB_TVOUT_input_61 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_61.dat"
#define AUTOTB_TVIN_input_62 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_62.dat"
#define AUTOTB_TVOUT_input_62 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_62.dat"
#define AUTOTB_TVIN_input_63 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_input_63.dat"
#define AUTOTB_TVOUT_input_63 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_input_63.dat"
#define AUTOTB_TVIN_logits_0 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_logits_0.dat"
#define AUTOTB_TVOUT_logits_0 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_logits_0.dat"
#define AUTOTB_TVIN_logits_1 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvin_logits_1.dat"
#define AUTOTB_TVOUT_logits_1 "../tv/cdatafile/c.imgds_linear_dense_q16.autotvout_logits_1.dat"


// tvout file define:
#define AUTOTB_TVOUT_PC_logits_0 "../tv/rtldatafile/rtl.imgds_linear_dense_q16.autotvout_logits_0.dat"
#define AUTOTB_TVOUT_PC_logits_1 "../tv/rtldatafile/rtl.imgds_linear_dense_q16.autotvout_logits_1.dat"


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
  const bool little_endian()
  {
    int a = 1;
    return *(char*)&a == 1;
  }

  inline void rev_endian(unsigned char *p, size_t nbytes)
  {
    std::reverse(p, p+nbytes);
  }

  const bool LE = little_endian();

  inline size_t least_nbyte(size_t width)
  {
    return (width+7)>>3;
  }

  std::string formatData(unsigned char *pos, size_t wbits)
  {
    size_t wbytes = least_nbyte(wbits);
    size_t i = LE ? wbytes-1 : 0;
    auto next = [&] () {
      auto c = pos[i];
      LE ? --i : ++i;
      return c;
    };
    std::ostringstream ss;
    ss << "0x";
    if (int t = (wbits & 0x7)) {
      if (t <= 4) {
        unsigned char mask = (1<<t)-1;
        ss << std::hex << std::setfill('0') << std::setw(1)
           << (int) (next() & mask);
        wbytes -= 1;
      }
    }
    for (size_t i = 0; i < wbytes; ++i) {
      ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
    }
    return ss.str();
  }

  char ord(char c)
  {
    if (c >= 'a' && c <= 'f') {
      return c-'a'+10;
    } else if (c >= 'A' && c <= 'F') {
      return c-'A'+10;
    } else if (c >= '0' && c <= '9') {
      return c-'0';
    } else {
      throw SimException("Not Hexdecimal Digit", __LINE__);
    }
  }

  void unformatData(const char *data, unsigned char *put)
  {
    size_t wbytes = (strlen(data)-2+1)>>1;
    put = LE ? put : put+wbytes-1;
    auto nextp = [&] () {
      return LE ? put++ : put--;
    };
    const char *c = data + strlen(data) - 1;
    auto next = [&] () {
      char res = ord(*c);
      --c;
      return res;
    };
    size_t fbytes = (strlen(data)-2)>>1;
    for (size_t i = 0; i < fbytes; ++i) {
      char l = next();
      char h = next();
      *nextp() = (h<<4)+l;
    }
    if (wbytes > fbytes) {
      *nextp() = next();
    }
  }

  char* strip(char *s)
  {
    while (isspace(*s)) {
      ++s;
    }
    for (char *p = s+strlen(s)-1; p >= s; --p) {
      if (isspace(*p)) {
        *p = 0;
      } else {
        return s;
      }
    }
    return s;
  }

  size_t sum(const std::vector<size_t> &v)
  {
    size_t res = 0;
    for (const auto &e : v) {
      res += e;
    }
    return res;
  }

  const char* bad = "Bad TV file";
  const char* err = "Error on TV file";

  const unsigned char bmark[] = {
    0x5a, 0x5a, 0xa5, 0xa5, 0x0f, 0x0f, 0xf0, 0xf0
  };

#ifdef USE_BINARY_TV_FILE
  class Input {
    FILE *fp;
    long pos;

    void read(unsigned char *buf, size_t size)
    {
      if (fread(buf, size, 1, fp) != 1) {
        throw SimException(bad, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    void advance(size_t nbytes)
    {
      if (fseek(fp, nbytes, SEEK_CUR) == -1) {
        throw SimException(bad, __LINE__);
      }
    }

    Input(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "rb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void begin()
    {
      advance(8);
      pos = ftell(fp);
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void into(unsigned char *param, size_t wbytes, size_t psize, size_t depth)
    {
      for (size_t i = 0; i < depth; ++i) {
        read(param, wbytes);
        param += psize;
      }
    }

    ~Input()
    {
      unsigned char buf[8];
      size_t res = fread(buf, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, bad);
      }
      if (std::memcmp(buf, bmark, 8) != 0) {
        errExit(__LINE__, bad);
      }
    }
  };

  class Output {
    FILE *fp;

    void write(unsigned char *buf, size_t size)
    {
      if (LE) {
        rev_endian(buf, size);
      }
      if (fwrite(buf, size, 1, fp) != 1) {
        throw SimException(err, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    Output(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "wb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void begin(size_t total)
    {
      unsigned char buf[8] = {0};
      std::memcpy(buf, &total, sizeof(buf));
      write(buf, sizeof(buf));
    }

    void from(unsigned char *param, size_t wbytes, size_t psize, size_t depth, size_t skip)
    {
      param -= psize*skip;
      for (size_t i = 0; i < depth; ++i) {
        write(param, wbytes);
        param += psize;
      }
    }

    ~Output()
    {
      size_t res = fwrite(bmark, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }
  };
#endif

  class Reader {
    FILE *fp;
    long pos;
    int size;
    char *s;

    void readline()
    {
      s = fgets(s, size, fp);
      if (s == nullptr) {
        throw SimException(bad, __LINE__);
      }
    }

  public:
    Reader(const char *path) : fp(nullptr), size(1<<12), s(new char[size])
    {
      try {
        fp = fopen(path, "r");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          readline();
          static const char mark[] = "[[[runtime]]]\n";
          if (strcmp(s, mark) != 0) {
            throw SimException(bad, __LINE__);
          }
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    ~Reader()
    {
      fclose(fp);
      delete[] s;
    }

    void begin()
    {
      readline();
      static const char mark[] = "[[transaction]]";
      if (strncmp(s, mark, strlen(mark)) != 0) {
        throw SimException(bad, __LINE__);
      }
      pos = ftell(fp);
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void skip(size_t n)
    {
      for (size_t i = 0; i < n; ++i) {
        readline();
      }
    }

    char* next()
    {
      long pos = ftell(fp);
      readline();
      if (*s == '[') {
        fseek(fp, pos, SEEK_SET);
        return nullptr;
      }
      return strip(s);
    }

    void end()
    {
      do {
        readline();
      } while (strcmp(s, "[[/transaction]]\n") != 0);
    }
  };

  class Writer {
    FILE *fp;

    void write(const char *s)
    {
      if (fputs(s, fp) == EOF) {
        throw SimException(err, __LINE__);
      }
    }

  public:
    Writer(const char *path) : fp(nullptr)
    {
      try {
        fp = fopen(path, "w");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          static const char mark[] = "[[[runtime]]]\n";
          write(mark);
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    virtual ~Writer()
    {
      try {
        static const char mark[] = "[[[/runtime]]]\n";
        write(mark);
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
      fclose(fp);
    }

    void begin(size_t AESL_transaction)
    {
      static const char mark[] = "[[transaction]]           ";
      write(mark);
      auto buf = std::to_string(AESL_transaction);
      buf.push_back('\n');
      buf.push_back('\0');
      write(buf.data());
    }

    void next(const char *s)
    {
      write(s);
      write("\n");
    }

    void end()
    {
      static const char mark[] = "[[/transaction]]\n";
      write(mark);
    }
  };

  bool RTLOutputCheckAndReplacement(char *data)
  {
    bool changed = false;
    for (size_t i = 2; i < strlen(data); ++i) {
      if (data[i] == 'X' || data[i] == 'x') {
        data[i] = '0';
        changed = true;
      }
    }
    return changed;
  }

  void warnOnX()
  {
    static const char msg[] =
      "WARNING: [SIM 212-201] RTL produces unknown value "
      "'x' or 'X' on some port, possible cause: "
      "There are uninitialized variables in the design.\n";
    fprintf(stderr, msg);
  }

#ifndef POST_CHECK
  class RefTCL {
    FILE *fp;
    std::ostringstream ss;

    void formatDepth()
    {
      ss << "set depth_list {\n";
      for (auto &p : depth) {
        ss << "  {" << p.first << " " << p.second << "}\n";
      }
      if (nameHBM != "") {
        ss << "  {" << nameHBM << " " << depthHBM << "}\n";
      }
      ss << "}\n";
    }

    void formatTransNum()
    {
      ss << "set trans_num " << AESL_transaction << "\n";
    }

    void formatHBM()
    {
      ss << "set HBM_ArgDict {\n"
         << "  Name " << nameHBM << "\n"
         << "  Port " << portHBM << "\n"
         << "  BitWidth " << widthHBM << "\n"
         << "}\n";
    }

    void close()
    {
      formatDepth();
      formatTransNum();
      if (nameHBM != "") {
        formatHBM();
      }
      std::string &&s { ss.str() };
      size_t res = fwrite(s.data(), s.size(), 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }

  public:
    std::map<const std::string, size_t> depth;
    std::string nameHBM;
    size_t depthHBM;
    std::string portHBM;
    unsigned widthHBM;
    size_t AESL_transaction;

    RefTCL(const char *path)
    {
      fp = fopen(path, "w");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void set(const char* name, size_t dep)
    {
      if (depth[name] < dep) {
        depth[name] = dep;
      }
    }

    ~RefTCL()
    {
      close();
    }
  };

#endif

  struct Register {
    const char* name;
    unsigned width;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (strcmp(name, "return") == 0) {
        tcl.set("ap_return", 1);
      } else {
        tcl.set(name, 1);
      }
    }
#endif
    ~Register()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename Reader, typename Writer>
  struct Memory {
    unsigned width;
    unsigned asize;
    bool hbm;
    std::vector<const char*> name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    std::vector<void*> param;
    std::vector<size_t> depth;
    std::vector<size_t> offset;
    std::vector<bool> hasWrite;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (hbm) {
        tcl.nameHBM.append(name[0]);
        tcl.portHBM.append("{").append(name[0]);
        for (size_t i = 1; i < name.size(); ++i) {
          tcl.nameHBM.append("_").append(name[i]);
          tcl.portHBM.append(" ").append(name[i]);
        }
        tcl.nameHBM.append("_HBM");
        tcl.portHBM.append("}");
        tcl.widthHBM = width;
        tcl.depthHBM = depth[0];
      } else {
        tcl.set(name[0], sum(depth));
      }
    }
#endif

    ~Memory()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  struct FIFO {
    unsigned width;
    unsigned asize;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;
    size_t depth;
    bool hasWrite;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~FIFO()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename E>
  struct Stream {
    unsigned width;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* writer;
    Writer* swriter;
    Writer* gwriter;
#endif
    hls::stream<E>* param;
    std::vector<E> buf;
    size_t initSize;
    size_t depth;
    bool hasWrite;

    void markSize()
    {
      initSize = param->size();
    }

    void buffer()
    {
      buf.clear();
      while (!param->empty()) {
        buf.push_back(param->read());
      }
      for (auto &e : buf) {
        param->write(e);
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~Stream()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete writer;
      delete swriter;
      delete gwriter;
#endif
    }
  };

#ifdef POST_CHECK
  void check(Register &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (char *s = port.reader->next()) {
      foundX |= RTLOutputCheckAndReplacement(s);
      unformatData(s, (unsigned char*)port.param);
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

#ifdef USE_BINARY_TV_FILE
  void checkHBM(Memory<Input, Output> &port)
  {
    port.reader->begin();
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.hasWrite[i]) {
        port.reader->reset();
        size_t skip = port.offset[i];
        size_t depth = port.depth[i] - skip;
        port.reader->advance(wbytes*skip);
        port.reader->into((unsigned char*)port.param[i], wbytes,
                          port.asize, depth);
      }
    }
  }

  void check(Memory<Input, Output> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      size_t wbytes = least_nbyte(port.width);
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          port.reader->into((unsigned char*)port.param[i], wbytes,
                            port.asize, port.depth[i]);
        } else {
          port.reader->advance(wbytes*port.depth[i]);
        }
      }
    }
  }
#endif
  void checkHBM(Memory<Reader, Writer> &port)
  {
    port.reader->begin();
    bool foundX = false;
    for (size_t i = 0, last = port.param.size()-1; i <= last; ++i) {
      if (port.hasWrite[i]) {
        port.reader->skip(port.offset[i]);
        for (size_t j = 0; j < port.depth[i]-port.offset[i]; ++j) {
          if (char *s = port.reader->next()) {
            foundX |= RTLOutputCheckAndReplacement(s);
            unformatData(s, (unsigned char*)port.param[i]+j*port.asize);
          }
        }
        if (i < last) {
          port.reader->reset();
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  void check(Memory<Reader, Writer> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      bool foundX = false;
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          for (size_t j = 0; j < port.depth[i]; ++j) {
            if (char *s = port.reader->next()) {
              foundX |= RTLOutputCheckAndReplacement(s);
              unformatData(s, (unsigned char*)port.param[i]+j*port.asize);
            }
          }
        } else {
          port.reader->skip(port.depth[i]);
        }
      }
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    }
  }

  void check(FIFO &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (port.hasWrite) {
      for (size_t j = 0; j < port.depth; ++j) {
        if (char *s = port.reader->next()) {
          foundX |= RTLOutputCheckAndReplacement(s);
          unformatData(s, (unsigned char*)port.param+j*port.asize);
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  template<typename E>
  void check(Stream<E> &port)
  {
    if (port.hasWrite) {
      port.reader->begin();
      bool foundX = false;
      E *p = new E;
      while (char *s = port.reader->next()) {
        foundX |= RTLOutputCheckAndReplacement(s);
        unformatData(s, (unsigned char*)p);
        port.param->write(*p);
      }
      delete p;
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    } else {
      port.reader->begin();
      size_t n = 0;
      if (char *s = port.reader->next()) {
        std::istringstream ss(s);
        ss >> n;
      } else {
        throw SimException(bad, __LINE__);
      }
      port.reader->end();
      for (size_t j = 0; j < n; ++j) {
        port.param->read();
      }
    }
  }
#else
  void dump(Register &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    std::string &&s { formatData((unsigned char*)port.param, port.width) };
    writer->next(s.data());
    writer->end();
  }

#ifdef USE_BINARY_TV_FILE
  void dump(Memory<Input, Output> &port, Output *writer, size_t AESL_transaction)
  {
    writer->begin(sum(port.depth));
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0; i < port.param.size(); ++i) {
      writer->from((unsigned char*)port.param[i], wbytes, port.asize,
                   port.depth[i], 0);
    }
  }

#endif
  void dump(Memory<Reader, Writer> &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    for (size_t i = 0; i < port.param.size(); ++i) {
      for (size_t j = 0; j < port.depth[i]; ++j) {
        std::string &&s {
          formatData((unsigned char*)port.param[i]+j*port.asize, port.width)
        };
        writer->next(s.data());
      }
      if (port.hbm) {
        break;
      }
    }
    writer->end();
  }

  void dump(FIFO &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    for (size_t j = 0; j < port.depth; ++j) {
      std::string &&s {
        formatData((unsigned char*)port.param+j*port.asize, port.width)
      };
      writer->next(s.data());
    }
    writer->end();
  }


  template<typename E>
  void dump(Stream<E> &port, size_t AESL_transaction)
  {
    if (port.hasWrite) {
      port.writer->begin(AESL_transaction);
      port.depth = port.param->size()-port.initSize;
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[port.initSize+j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();
    } else {
      port.writer->begin(AESL_transaction);
      port.depth = port.initSize-port.param->size();
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();

      port.gwriter->begin(AESL_transaction);
      size_t n = (port.depth ? port.initSize : port.depth);
      size_t d = port.depth;
      do {
        port.gwriter->next(std::to_string(n--).c_str());
      } while (d--);
      port.gwriter->end();
    }
  }
#endif
}



extern "C"
void imgds_linear_dense_q16_hw_stub_wrapper(void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*);

extern "C"
void apatb_imgds_linear_dense_q16_hw(void* __xlx_apatb_param_input_0, void* __xlx_apatb_param_input_1, void* __xlx_apatb_param_input_2, void* __xlx_apatb_param_input_3, void* __xlx_apatb_param_input_4, void* __xlx_apatb_param_input_5, void* __xlx_apatb_param_input_6, void* __xlx_apatb_param_input_7, void* __xlx_apatb_param_input_8, void* __xlx_apatb_param_input_9, void* __xlx_apatb_param_input_10, void* __xlx_apatb_param_input_11, void* __xlx_apatb_param_input_12, void* __xlx_apatb_param_input_13, void* __xlx_apatb_param_input_14, void* __xlx_apatb_param_input_15, void* __xlx_apatb_param_input_16, void* __xlx_apatb_param_input_17, void* __xlx_apatb_param_input_18, void* __xlx_apatb_param_input_19, void* __xlx_apatb_param_input_20, void* __xlx_apatb_param_input_21, void* __xlx_apatb_param_input_22, void* __xlx_apatb_param_input_23, void* __xlx_apatb_param_input_24, void* __xlx_apatb_param_input_25, void* __xlx_apatb_param_input_26, void* __xlx_apatb_param_input_27, void* __xlx_apatb_param_input_28, void* __xlx_apatb_param_input_29, void* __xlx_apatb_param_input_30, void* __xlx_apatb_param_input_31, void* __xlx_apatb_param_input_32, void* __xlx_apatb_param_input_33, void* __xlx_apatb_param_input_34, void* __xlx_apatb_param_input_35, void* __xlx_apatb_param_input_36, void* __xlx_apatb_param_input_37, void* __xlx_apatb_param_input_38, void* __xlx_apatb_param_input_39, void* __xlx_apatb_param_input_40, void* __xlx_apatb_param_input_41, void* __xlx_apatb_param_input_42, void* __xlx_apatb_param_input_43, void* __xlx_apatb_param_input_44, void* __xlx_apatb_param_input_45, void* __xlx_apatb_param_input_46, void* __xlx_apatb_param_input_47, void* __xlx_apatb_param_input_48, void* __xlx_apatb_param_input_49, void* __xlx_apatb_param_input_50, void* __xlx_apatb_param_input_51, void* __xlx_apatb_param_input_52, void* __xlx_apatb_param_input_53, void* __xlx_apatb_param_input_54, void* __xlx_apatb_param_input_55, void* __xlx_apatb_param_input_56, void* __xlx_apatb_param_input_57, void* __xlx_apatb_param_input_58, void* __xlx_apatb_param_input_59, void* __xlx_apatb_param_input_60, void* __xlx_apatb_param_input_61, void* __xlx_apatb_param_input_62, void* __xlx_apatb_param_input_63, void* __xlx_apatb_param_logits_0, void* __xlx_apatb_param_logits_1)
{
  static hls::sim::Register port0 {
    .name = "logits_0",
    .width = 16,
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_logits_0),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_logits_0),
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_logits_0),
#endif
  };
  port0.param = __xlx_apatb_param_logits_0;

  static hls::sim::Register port1 {
    .name = "logits_1",
    .width = 16,
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_logits_1),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_logits_1),
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_logits_1),
#endif
  };
  port1.param = __xlx_apatb_param_logits_1;

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port2 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port2 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_0" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_0),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_0),
#endif
#endif
  };
  port2.param = { __xlx_apatb_param_input_0 };
  port2.depth = { 16 };
  port2.offset = {  };
  port2.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port3 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port3 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_1" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_1),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_1),
#endif
#endif
  };
  port3.param = { __xlx_apatb_param_input_1 };
  port3.depth = { 16 };
  port3.offset = {  };
  port3.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port4 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port4 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_2" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_2),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_2),
#endif
#endif
  };
  port4.param = { __xlx_apatb_param_input_2 };
  port4.depth = { 16 };
  port4.offset = {  };
  port4.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port5 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port5 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_3" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_3),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_3),
#endif
#endif
  };
  port5.param = { __xlx_apatb_param_input_3 };
  port5.depth = { 16 };
  port5.offset = {  };
  port5.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port6 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port6 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_4" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_4),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_4),
#endif
#endif
  };
  port6.param = { __xlx_apatb_param_input_4 };
  port6.depth = { 16 };
  port6.offset = {  };
  port6.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port7 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port7 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_5" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_5),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_5),
#endif
#endif
  };
  port7.param = { __xlx_apatb_param_input_5 };
  port7.depth = { 16 };
  port7.offset = {  };
  port7.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port8 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port8 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_6" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_6),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_6),
#endif
#endif
  };
  port8.param = { __xlx_apatb_param_input_6 };
  port8.depth = { 16 };
  port8.offset = {  };
  port8.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port9 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port9 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_7" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_7),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_7),
#endif
#endif
  };
  port9.param = { __xlx_apatb_param_input_7 };
  port9.depth = { 16 };
  port9.offset = {  };
  port9.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port10 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port10 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_8" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_8),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_8),
#endif
#endif
  };
  port10.param = { __xlx_apatb_param_input_8 };
  port10.depth = { 16 };
  port10.offset = {  };
  port10.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port11 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port11 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_9" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_9),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_9),
#endif
#endif
  };
  port11.param = { __xlx_apatb_param_input_9 };
  port11.depth = { 16 };
  port11.offset = {  };
  port11.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port12 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port12 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_10" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_10),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_10),
#endif
#endif
  };
  port12.param = { __xlx_apatb_param_input_10 };
  port12.depth = { 16 };
  port12.offset = {  };
  port12.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port13 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port13 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_11" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_11),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_11),
#endif
#endif
  };
  port13.param = { __xlx_apatb_param_input_11 };
  port13.depth = { 16 };
  port13.offset = {  };
  port13.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port14 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port14 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_12" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_12),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_12),
#endif
#endif
  };
  port14.param = { __xlx_apatb_param_input_12 };
  port14.depth = { 16 };
  port14.offset = {  };
  port14.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port15 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port15 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_13" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_13),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_13),
#endif
#endif
  };
  port15.param = { __xlx_apatb_param_input_13 };
  port15.depth = { 16 };
  port15.offset = {  };
  port15.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port16 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port16 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_14" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_14),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_14),
#endif
#endif
  };
  port16.param = { __xlx_apatb_param_input_14 };
  port16.depth = { 16 };
  port16.offset = {  };
  port16.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port17 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port17 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_15" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_15),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_15),
#endif
#endif
  };
  port17.param = { __xlx_apatb_param_input_15 };
  port17.depth = { 16 };
  port17.offset = {  };
  port17.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port18 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port18 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_16" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_16),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_16),
#endif
#endif
  };
  port18.param = { __xlx_apatb_param_input_16 };
  port18.depth = { 16 };
  port18.offset = {  };
  port18.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port19 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port19 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_17" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_17),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_17),
#endif
#endif
  };
  port19.param = { __xlx_apatb_param_input_17 };
  port19.depth = { 16 };
  port19.offset = {  };
  port19.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port20 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port20 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_18" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_18),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_18),
#endif
#endif
  };
  port20.param = { __xlx_apatb_param_input_18 };
  port20.depth = { 16 };
  port20.offset = {  };
  port20.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port21 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port21 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_19" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_19),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_19),
#endif
#endif
  };
  port21.param = { __xlx_apatb_param_input_19 };
  port21.depth = { 16 };
  port21.offset = {  };
  port21.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port22 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port22 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_20" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_20),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_20),
#endif
#endif
  };
  port22.param = { __xlx_apatb_param_input_20 };
  port22.depth = { 16 };
  port22.offset = {  };
  port22.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port23 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port23 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_21" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_21),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_21),
#endif
#endif
  };
  port23.param = { __xlx_apatb_param_input_21 };
  port23.depth = { 16 };
  port23.offset = {  };
  port23.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port24 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port24 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_22" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_22),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_22),
#endif
#endif
  };
  port24.param = { __xlx_apatb_param_input_22 };
  port24.depth = { 16 };
  port24.offset = {  };
  port24.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port25 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port25 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_23" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_23),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_23),
#endif
#endif
  };
  port25.param = { __xlx_apatb_param_input_23 };
  port25.depth = { 16 };
  port25.offset = {  };
  port25.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port26 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port26 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_24" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_24),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_24),
#endif
#endif
  };
  port26.param = { __xlx_apatb_param_input_24 };
  port26.depth = { 16 };
  port26.offset = {  };
  port26.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port27 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port27 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_25" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_25),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_25),
#endif
#endif
  };
  port27.param = { __xlx_apatb_param_input_25 };
  port27.depth = { 16 };
  port27.offset = {  };
  port27.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port28 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port28 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_26" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_26),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_26),
#endif
#endif
  };
  port28.param = { __xlx_apatb_param_input_26 };
  port28.depth = { 16 };
  port28.offset = {  };
  port28.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port29 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port29 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_27" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_27),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_27),
#endif
#endif
  };
  port29.param = { __xlx_apatb_param_input_27 };
  port29.depth = { 16 };
  port29.offset = {  };
  port29.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port30 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port30 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_28" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_28),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_28),
#endif
#endif
  };
  port30.param = { __xlx_apatb_param_input_28 };
  port30.depth = { 16 };
  port30.offset = {  };
  port30.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port31 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port31 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_29" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_29),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_29),
#endif
#endif
  };
  port31.param = { __xlx_apatb_param_input_29 };
  port31.depth = { 16 };
  port31.offset = {  };
  port31.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port32 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port32 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_30" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_30),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_30),
#endif
#endif
  };
  port32.param = { __xlx_apatb_param_input_30 };
  port32.depth = { 16 };
  port32.offset = {  };
  port32.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port33 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port33 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_31" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_31),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_31),
#endif
#endif
  };
  port33.param = { __xlx_apatb_param_input_31 };
  port33.depth = { 16 };
  port33.offset = {  };
  port33.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port34 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port34 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_32" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_32),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_32),
#endif
#endif
  };
  port34.param = { __xlx_apatb_param_input_32 };
  port34.depth = { 16 };
  port34.offset = {  };
  port34.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port35 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port35 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_33" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_33),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_33),
#endif
#endif
  };
  port35.param = { __xlx_apatb_param_input_33 };
  port35.depth = { 16 };
  port35.offset = {  };
  port35.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port36 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port36 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_34" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_34),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_34),
#endif
#endif
  };
  port36.param = { __xlx_apatb_param_input_34 };
  port36.depth = { 16 };
  port36.offset = {  };
  port36.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port37 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port37 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_35" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_35),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_35),
#endif
#endif
  };
  port37.param = { __xlx_apatb_param_input_35 };
  port37.depth = { 16 };
  port37.offset = {  };
  port37.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port38 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port38 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_36" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_36),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_36),
#endif
#endif
  };
  port38.param = { __xlx_apatb_param_input_36 };
  port38.depth = { 16 };
  port38.offset = {  };
  port38.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port39 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port39 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_37" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_37),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_37),
#endif
#endif
  };
  port39.param = { __xlx_apatb_param_input_37 };
  port39.depth = { 16 };
  port39.offset = {  };
  port39.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port40 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port40 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_38" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_38),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_38),
#endif
#endif
  };
  port40.param = { __xlx_apatb_param_input_38 };
  port40.depth = { 16 };
  port40.offset = {  };
  port40.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port41 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port41 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_39" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_39),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_39),
#endif
#endif
  };
  port41.param = { __xlx_apatb_param_input_39 };
  port41.depth = { 16 };
  port41.offset = {  };
  port41.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port42 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port42 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_40" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_40),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_40),
#endif
#endif
  };
  port42.param = { __xlx_apatb_param_input_40 };
  port42.depth = { 16 };
  port42.offset = {  };
  port42.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port43 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port43 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_41" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_41),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_41),
#endif
#endif
  };
  port43.param = { __xlx_apatb_param_input_41 };
  port43.depth = { 16 };
  port43.offset = {  };
  port43.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port44 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port44 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_42" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_42),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_42),
#endif
#endif
  };
  port44.param = { __xlx_apatb_param_input_42 };
  port44.depth = { 16 };
  port44.offset = {  };
  port44.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port45 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port45 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_43" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_43),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_43),
#endif
#endif
  };
  port45.param = { __xlx_apatb_param_input_43 };
  port45.depth = { 16 };
  port45.offset = {  };
  port45.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port46 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port46 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_44" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_44),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_44),
#endif
#endif
  };
  port46.param = { __xlx_apatb_param_input_44 };
  port46.depth = { 16 };
  port46.offset = {  };
  port46.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port47 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port47 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_45" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_45),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_45),
#endif
#endif
  };
  port47.param = { __xlx_apatb_param_input_45 };
  port47.depth = { 16 };
  port47.offset = {  };
  port47.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port48 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port48 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_46" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_46),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_46),
#endif
#endif
  };
  port48.param = { __xlx_apatb_param_input_46 };
  port48.depth = { 16 };
  port48.offset = {  };
  port48.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port49 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port49 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_47" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_47),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_47),
#endif
#endif
  };
  port49.param = { __xlx_apatb_param_input_47 };
  port49.depth = { 16 };
  port49.offset = {  };
  port49.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port50 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port50 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_48" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_48),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_48),
#endif
#endif
  };
  port50.param = { __xlx_apatb_param_input_48 };
  port50.depth = { 16 };
  port50.offset = {  };
  port50.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port51 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port51 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_49" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_49),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_49),
#endif
#endif
  };
  port51.param = { __xlx_apatb_param_input_49 };
  port51.depth = { 16 };
  port51.offset = {  };
  port51.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port52 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port52 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_50" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_50),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_50),
#endif
#endif
  };
  port52.param = { __xlx_apatb_param_input_50 };
  port52.depth = { 16 };
  port52.offset = {  };
  port52.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port53 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port53 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_51" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_51),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_51),
#endif
#endif
  };
  port53.param = { __xlx_apatb_param_input_51 };
  port53.depth = { 16 };
  port53.offset = {  };
  port53.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port54 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port54 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_52" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_52),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_52),
#endif
#endif
  };
  port54.param = { __xlx_apatb_param_input_52 };
  port54.depth = { 16 };
  port54.offset = {  };
  port54.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port55 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port55 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_53" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_53),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_53),
#endif
#endif
  };
  port55.param = { __xlx_apatb_param_input_53 };
  port55.depth = { 16 };
  port55.offset = {  };
  port55.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port56 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port56 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_54" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_54),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_54),
#endif
#endif
  };
  port56.param = { __xlx_apatb_param_input_54 };
  port56.depth = { 16 };
  port56.offset = {  };
  port56.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port57 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port57 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_55" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_55),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_55),
#endif
#endif
  };
  port57.param = { __xlx_apatb_param_input_55 };
  port57.depth = { 16 };
  port57.offset = {  };
  port57.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port58 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port58 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_56" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_56),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_56),
#endif
#endif
  };
  port58.param = { __xlx_apatb_param_input_56 };
  port58.depth = { 16 };
  port58.offset = {  };
  port58.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port59 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port59 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_57" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_57),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_57),
#endif
#endif
  };
  port59.param = { __xlx_apatb_param_input_57 };
  port59.depth = { 16 };
  port59.offset = {  };
  port59.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port60 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port60 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_58" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_58),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_58),
#endif
#endif
  };
  port60.param = { __xlx_apatb_param_input_58 };
  port60.depth = { 16 };
  port60.offset = {  };
  port60.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port61 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port61 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_59" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_59),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_59),
#endif
#endif
  };
  port61.param = { __xlx_apatb_param_input_59 };
  port61.depth = { 16 };
  port61.offset = {  };
  port61.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port62 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port62 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_60" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_60),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_60),
#endif
#endif
  };
  port62.param = { __xlx_apatb_param_input_60 };
  port62.depth = { 16 };
  port62.offset = {  };
  port62.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port63 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port63 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_61" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_61),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_61),
#endif
#endif
  };
  port63.param = { __xlx_apatb_param_input_61 };
  port63.depth = { 16 };
  port63.offset = {  };
  port63.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port64 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port64 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_62" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_62),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_62),
#endif
#endif
  };
  port64.param = { __xlx_apatb_param_input_62 };
  port64.depth = { 16 };
  port64.offset = {  };
  port64.hasWrite = { false };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port65 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port65 {
#endif
    .width = 16,
    .asize = 2,
    .hbm = false,
    .name = { "input_63" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_input_63),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_input_63),
#endif
#endif
  };
  port65.param = { __xlx_apatb_param_input_63 };
  port65.depth = { 16 };
  port65.offset = {  };
  port65.hasWrite = { false };

  refine_signal_handler();
  try {
#ifdef POST_CHECK
    CodeState = ENTER_WRAPC_PC;
    check(port0);
    check(port1);
#else
    static hls::sim::RefTCL tcl("../tv/cdatafile/ref.tcl");
    CodeState = DUMP_INPUTS;
    dump(port0, port0.iwriter, tcl.AESL_transaction);
    dump(port1, port1.iwriter, tcl.AESL_transaction);
    dump(port2, port2.iwriter, tcl.AESL_transaction);
    dump(port3, port3.iwriter, tcl.AESL_transaction);
    dump(port4, port4.iwriter, tcl.AESL_transaction);
    dump(port5, port5.iwriter, tcl.AESL_transaction);
    dump(port6, port6.iwriter, tcl.AESL_transaction);
    dump(port7, port7.iwriter, tcl.AESL_transaction);
    dump(port8, port8.iwriter, tcl.AESL_transaction);
    dump(port9, port9.iwriter, tcl.AESL_transaction);
    dump(port10, port10.iwriter, tcl.AESL_transaction);
    dump(port11, port11.iwriter, tcl.AESL_transaction);
    dump(port12, port12.iwriter, tcl.AESL_transaction);
    dump(port13, port13.iwriter, tcl.AESL_transaction);
    dump(port14, port14.iwriter, tcl.AESL_transaction);
    dump(port15, port15.iwriter, tcl.AESL_transaction);
    dump(port16, port16.iwriter, tcl.AESL_transaction);
    dump(port17, port17.iwriter, tcl.AESL_transaction);
    dump(port18, port18.iwriter, tcl.AESL_transaction);
    dump(port19, port19.iwriter, tcl.AESL_transaction);
    dump(port20, port20.iwriter, tcl.AESL_transaction);
    dump(port21, port21.iwriter, tcl.AESL_transaction);
    dump(port22, port22.iwriter, tcl.AESL_transaction);
    dump(port23, port23.iwriter, tcl.AESL_transaction);
    dump(port24, port24.iwriter, tcl.AESL_transaction);
    dump(port25, port25.iwriter, tcl.AESL_transaction);
    dump(port26, port26.iwriter, tcl.AESL_transaction);
    dump(port27, port27.iwriter, tcl.AESL_transaction);
    dump(port28, port28.iwriter, tcl.AESL_transaction);
    dump(port29, port29.iwriter, tcl.AESL_transaction);
    dump(port30, port30.iwriter, tcl.AESL_transaction);
    dump(port31, port31.iwriter, tcl.AESL_transaction);
    dump(port32, port32.iwriter, tcl.AESL_transaction);
    dump(port33, port33.iwriter, tcl.AESL_transaction);
    dump(port34, port34.iwriter, tcl.AESL_transaction);
    dump(port35, port35.iwriter, tcl.AESL_transaction);
    dump(port36, port36.iwriter, tcl.AESL_transaction);
    dump(port37, port37.iwriter, tcl.AESL_transaction);
    dump(port38, port38.iwriter, tcl.AESL_transaction);
    dump(port39, port39.iwriter, tcl.AESL_transaction);
    dump(port40, port40.iwriter, tcl.AESL_transaction);
    dump(port41, port41.iwriter, tcl.AESL_transaction);
    dump(port42, port42.iwriter, tcl.AESL_transaction);
    dump(port43, port43.iwriter, tcl.AESL_transaction);
    dump(port44, port44.iwriter, tcl.AESL_transaction);
    dump(port45, port45.iwriter, tcl.AESL_transaction);
    dump(port46, port46.iwriter, tcl.AESL_transaction);
    dump(port47, port47.iwriter, tcl.AESL_transaction);
    dump(port48, port48.iwriter, tcl.AESL_transaction);
    dump(port49, port49.iwriter, tcl.AESL_transaction);
    dump(port50, port50.iwriter, tcl.AESL_transaction);
    dump(port51, port51.iwriter, tcl.AESL_transaction);
    dump(port52, port52.iwriter, tcl.AESL_transaction);
    dump(port53, port53.iwriter, tcl.AESL_transaction);
    dump(port54, port54.iwriter, tcl.AESL_transaction);
    dump(port55, port55.iwriter, tcl.AESL_transaction);
    dump(port56, port56.iwriter, tcl.AESL_transaction);
    dump(port57, port57.iwriter, tcl.AESL_transaction);
    dump(port58, port58.iwriter, tcl.AESL_transaction);
    dump(port59, port59.iwriter, tcl.AESL_transaction);
    dump(port60, port60.iwriter, tcl.AESL_transaction);
    dump(port61, port61.iwriter, tcl.AESL_transaction);
    dump(port62, port62.iwriter, tcl.AESL_transaction);
    dump(port63, port63.iwriter, tcl.AESL_transaction);
    dump(port64, port64.iwriter, tcl.AESL_transaction);
    dump(port65, port65.iwriter, tcl.AESL_transaction);
    port0.doTCL(tcl);
    port1.doTCL(tcl);
    port2.doTCL(tcl);
    port3.doTCL(tcl);
    port4.doTCL(tcl);
    port5.doTCL(tcl);
    port6.doTCL(tcl);
    port7.doTCL(tcl);
    port8.doTCL(tcl);
    port9.doTCL(tcl);
    port10.doTCL(tcl);
    port11.doTCL(tcl);
    port12.doTCL(tcl);
    port13.doTCL(tcl);
    port14.doTCL(tcl);
    port15.doTCL(tcl);
    port16.doTCL(tcl);
    port17.doTCL(tcl);
    port18.doTCL(tcl);
    port19.doTCL(tcl);
    port20.doTCL(tcl);
    port21.doTCL(tcl);
    port22.doTCL(tcl);
    port23.doTCL(tcl);
    port24.doTCL(tcl);
    port25.doTCL(tcl);
    port26.doTCL(tcl);
    port27.doTCL(tcl);
    port28.doTCL(tcl);
    port29.doTCL(tcl);
    port30.doTCL(tcl);
    port31.doTCL(tcl);
    port32.doTCL(tcl);
    port33.doTCL(tcl);
    port34.doTCL(tcl);
    port35.doTCL(tcl);
    port36.doTCL(tcl);
    port37.doTCL(tcl);
    port38.doTCL(tcl);
    port39.doTCL(tcl);
    port40.doTCL(tcl);
    port41.doTCL(tcl);
    port42.doTCL(tcl);
    port43.doTCL(tcl);
    port44.doTCL(tcl);
    port45.doTCL(tcl);
    port46.doTCL(tcl);
    port47.doTCL(tcl);
    port48.doTCL(tcl);
    port49.doTCL(tcl);
    port50.doTCL(tcl);
    port51.doTCL(tcl);
    port52.doTCL(tcl);
    port53.doTCL(tcl);
    port54.doTCL(tcl);
    port55.doTCL(tcl);
    port56.doTCL(tcl);
    port57.doTCL(tcl);
    port58.doTCL(tcl);
    port59.doTCL(tcl);
    port60.doTCL(tcl);
    port61.doTCL(tcl);
    port62.doTCL(tcl);
    port63.doTCL(tcl);
    port64.doTCL(tcl);
    port65.doTCL(tcl);
    CodeState = CALL_C_DUT;
    imgds_linear_dense_q16_hw_stub_wrapper(__xlx_apatb_param_input_0, __xlx_apatb_param_input_1, __xlx_apatb_param_input_2, __xlx_apatb_param_input_3, __xlx_apatb_param_input_4, __xlx_apatb_param_input_5, __xlx_apatb_param_input_6, __xlx_apatb_param_input_7, __xlx_apatb_param_input_8, __xlx_apatb_param_input_9, __xlx_apatb_param_input_10, __xlx_apatb_param_input_11, __xlx_apatb_param_input_12, __xlx_apatb_param_input_13, __xlx_apatb_param_input_14, __xlx_apatb_param_input_15, __xlx_apatb_param_input_16, __xlx_apatb_param_input_17, __xlx_apatb_param_input_18, __xlx_apatb_param_input_19, __xlx_apatb_param_input_20, __xlx_apatb_param_input_21, __xlx_apatb_param_input_22, __xlx_apatb_param_input_23, __xlx_apatb_param_input_24, __xlx_apatb_param_input_25, __xlx_apatb_param_input_26, __xlx_apatb_param_input_27, __xlx_apatb_param_input_28, __xlx_apatb_param_input_29, __xlx_apatb_param_input_30, __xlx_apatb_param_input_31, __xlx_apatb_param_input_32, __xlx_apatb_param_input_33, __xlx_apatb_param_input_34, __xlx_apatb_param_input_35, __xlx_apatb_param_input_36, __xlx_apatb_param_input_37, __xlx_apatb_param_input_38, __xlx_apatb_param_input_39, __xlx_apatb_param_input_40, __xlx_apatb_param_input_41, __xlx_apatb_param_input_42, __xlx_apatb_param_input_43, __xlx_apatb_param_input_44, __xlx_apatb_param_input_45, __xlx_apatb_param_input_46, __xlx_apatb_param_input_47, __xlx_apatb_param_input_48, __xlx_apatb_param_input_49, __xlx_apatb_param_input_50, __xlx_apatb_param_input_51, __xlx_apatb_param_input_52, __xlx_apatb_param_input_53, __xlx_apatb_param_input_54, __xlx_apatb_param_input_55, __xlx_apatb_param_input_56, __xlx_apatb_param_input_57, __xlx_apatb_param_input_58, __xlx_apatb_param_input_59, __xlx_apatb_param_input_60, __xlx_apatb_param_input_61, __xlx_apatb_param_input_62, __xlx_apatb_param_input_63, __xlx_apatb_param_logits_0, __xlx_apatb_param_logits_1);
    CodeState = DUMP_OUTPUTS;
    dump(port0, port0.owriter, tcl.AESL_transaction);
    dump(port1, port1.owriter, tcl.AESL_transaction);
    tcl.AESL_transaction++;
#endif
  } catch (const hls::sim::SimException &e) {
    hls::sim::errExit(e.line, e.msg);
  }
}