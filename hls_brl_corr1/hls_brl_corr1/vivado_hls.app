<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="hls_brl_corr1" top="barrel_correction_simple">
    <solutions>
        <solution name="sln1" status=""/>
    </solutions>
    <files>
        <file name="src/brl_corr_hls.h" sc="0" tb="false" cflags=""/>
        <file name="../../src/brl_corr_hls_tb.cpp" sc="0" tb="1" cflags=" "/>
        <file name="src/brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
    </files>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

