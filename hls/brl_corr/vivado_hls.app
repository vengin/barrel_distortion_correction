<project xmlns="com.autoesl.autopilot.project" top="" name="brl_corr">
    <files>
        <file name="src/brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
        <file name="../../src/brl_corr_hls.cpp" sc="0" tb="1" cflags=""/>
        <file name="src/brl_corr_hls.cpp" sc="0" tb="false" cflags=""/>
        <file name="../../src/brl_corr_hls.cpp" sc="0" tb="1" cflags=""/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="-DTESTBENCH" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="sln1" status="active"/>
    </solutions>
</project>

