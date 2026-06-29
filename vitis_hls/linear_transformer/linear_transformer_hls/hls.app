<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" top="transformer" name="linear_transformer_hls">
    <includePaths/>
    <libraryFlag/>
    <files>
        <file name="../../linear_transformer_tb.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="scaled_dp_params.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="linear_transformer.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="linear_transformer.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

