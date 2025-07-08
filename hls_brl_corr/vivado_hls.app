<project xmlns="com.autoesl.autopilot.project" name="hls_brl_corr" top="barrel_correction_simple">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" clean="false" csimMode="0" lastCsimMode="2" setup="false" optimizeCompile="false"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="sln1" status="active"/>
    </solutions>
    <files xmlns="">
        <file name="src/brl_corr_hls.h" sc="0" tb="false" cflags=""/>
        <file name="../../src/brl_corr_hls_tb.cpp" sc="0" tb="1" cflags=" "/>
        <file name="src/brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
        <file name="brl_corr_hls.h" sc="0" tb="false" cflags=""/>
        <file name="../../brl_corr_hls_tb.cpp" sc="0" tb="1" cflags=" "/>
        <file name="brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
        <file name="hls_brl_corr/src/brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
        <file name="hls_brl_corr/src/brl_corr_hls.h" sc="0" tb="false" cflags=""/>
        <file name="../src/brl_corr_hls_tb.cpp" sc="0" tb="1" cflags=""/>
    </files>
</project>

