`timescale 1ns/1ps
`include "src/top_sum_res.v"

module top_sum_res_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg Sel;
    reg clk;
    reg rst;
    
    wire [0:6] SSeg;
    wire [3:0] an;

    top_sum_res TSR (
        .A(A),
        .B(B),
        .Sel(Sel),
        .clk(clk),
        .rst(rst),
        .SSeg(SSeg),
        .an(an)
    );

    always begin
        clk = ~clk;
        #5;
    end

    initial begin

        A = 0;
        B = 0;
        Sel = 0;
        clk = 0;
        rst = 1;
        #10;

        rst = 0;

        A = 4'd3;
        B = 4'd2;
        Sel = 0;
        #20;

        Sel = 1;
        #20;

        A = 4'd2;
        B = 4'd3;
        Sel = 1;
        #20;

        A = 4'd8;
        B = 4'd8;
        Sel = 0;
        #20;
    end

    initial begin
        $dumpfile("top_sum_res_tb.vcd");
        $dumpvars(0, top_sum_res_tb);
        #100 $finish;
    end

endmodule
/* 
linux-vdso.so.1 (0x00007cb06eb16000)
        libgtk-3.so.0 => /lib/x86_64-linux-gnu/libgtk-3.so.0 (0x00007cb06e000000)
        libgdk-3.so.0 => /lib/x86_64-linux-gnu/libgdk-3.so.0 (0x00007cb06e870000)
        libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007cb06e854000)
        libpangocairo-1.0.so.0 => /lib/x86_64-linux-gnu/libpangocairo-1.0.so.0 (0x00007cb06e843000)
        libpango-1.0.so.0 => /lib/x86_64-linux-gnu/libpango-1.0.so.0 (0x00007cb06e7d8000)
        libcairo.so.2 => /lib/x86_64-linux-gnu/libcairo.so.2 (0x00007cb06debc000)
        libgdk_pixbuf-2.0.so.0 => /lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0 (0x00007cb06de8e000)
        libgio-2.0.so.0 => /lib/x86_64-linux-gnu/libgio-2.0.so.0 (0x00007cb06dcbe000)
        libgobject-2.0.so.0 => /lib/x86_64-linux-gnu/libgobject-2.0.so.0 (0x00007cb06dc5b000)
        libglib-2.0.so.0 => /lib/x86_64-linux-gnu/libglib-2.0.so.0 (0x00007cb06db12000)
        liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007cb06dae0000)
        libbz2.so.1.0 => /lib/x86_64-linux-gnu/libbz2.so.1.0 (0x00007cb06dacc000)
        libtcl8.6.so => /lib/x86_64-linux-gnu/libtcl8.6.so (0x00007cb06d91f000)
        libtk8.6.so => /lib/x86_64-linux-gnu/libtk8.6.so (0x00007cb06d7ac000)
        libJudy.so.1 => /lib/x86_64-linux-gnu/libJudy.so.1 (0x00007cb06d760000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007cb06d677000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007cb06d400000)
        libgmodule-2.0.so.0 => /lib/x86_64-linux-gnu/libgmodule-2.0.so.0 (0x00007cb06e7cb000)
        libharfbuzz.so.0 => /lib/x86_64-linux-gnu/libharfbuzz.so.0 (0x00007cb06d2f3000)
        libpangoft2-1.0.so.0 => /lib/x86_64-linux-gnu/libpangoft2-1.0.so.0 (0x00007cb06d65c000)
        libfontconfig.so.1 => /lib/x86_64-linux-gnu/libfontconfig.so.1 (0x00007cb06d2a2000)
        libfribidi.so.0 => /lib/x86_64-linux-gnu/libfribidi.so.0 (0x00007cb06d63e000)
        libcairo-gobject.so.2 => /lib/x86_64-linux-gnu/libcairo-gobject.so.2 (0x00007cb06d632000)
        libatk-1.0.so.0 => /lib/x86_64-linux-gnu/libatk-1.0.so.0 (0x00007cb06d278000)
        libepoxy.so.0 => /lib/x86_64-linux-gnu/libepoxy.so.0 (0x00007cb06d155000)
        libXi.so.6 => /lib/x86_64-linux-gnu/libXi.so.6 (0x00007cb06d61f000)
        libX11.so.6 => /lib/x86_64-linux-gnu/libX11.so.6 (0x00007cb06d018000)
        libatk-bridge-2.0.so.0 => /lib/x86_64-linux-gnu/libatk-bridge-2.0.so.0 (0x00007cb06cfdc000)
        libXfixes.so.3 => /lib/x86_64-linux-gnu/libXfixes.so.3 (0x00007cb06d617000)
        libxkbcommon.so.0 => /lib/x86_64-linux-gnu/libxkbcommon.so.0 (0x00007cb06cf93000)
        libwayland-client.so.0 => /lib/x86_64-linux-gnu/libwayland-client.so.0 (0x00007cb06cf83000)
        libwayland-cursor.so.0 => /lib/x86_64-linux-gnu/libwayland-cursor.so.0 (0x00007cb06cf79000)
        libwayland-egl.so.1 => /lib/x86_64-linux-gnu/libwayland-egl.so.1 (0x00007cb06d612000)
        libXext.so.6 => /lib/x86_64-linux-gnu/libXext.so.6 (0x00007cb06cf65000)
        libXcursor.so.1 => /lib/x86_64-linux-gnu/libXcursor.so.1 (0x00007cb06cf57000)
        libXdamage.so.1 => /lib/x86_64-linux-gnu/libXdamage.so.1 (0x00007cb06cf52000)
        libXcomposite.so.1 => /lib/x86_64-linux-gnu/libXcomposite.so.1 (0x00007cb06cf4d000)
        libXrandr.so.2 => /lib/x86_64-linux-gnu/libXrandr.so.2 (0x00007cb06cf40000)
        libXinerama.so.1 => /lib/x86_64-linux-gnu/libXinerama.so.1 (0x00007cb06cf3b000)
        libthai.so.0 => /lib/x86_64-linux-gnu/libthai.so.0 (0x00007cb06cf2e000)
        libpng16.so.16 => /lib/x86_64-linux-gnu/libpng16.so.16 (0x00007cb06cef6000)
        libfreetype.so.6 => /lib/x86_64-linux-gnu/libfreetype.so.6 (0x00007cb06ce2a000)
        libXrender.so.1 => /lib/x86_64-linux-gnu/libXrender.so.1 (0x00007cb06ce1e000)
        libxcb.so.1 => /lib/x86_64-linux-gnu/libxcb.so.1 (0x00007cb06cdf5000)
        libxcb-render.so.0 => /lib/x86_64-linux-gnu/libxcb-render.so.0 (0x00007cb06cde4000)
        libxcb-shm.so.0 => /lib/x86_64-linux-gnu/libxcb-shm.so.0 (0x00007cb06cddf000)
        libpixman-1.so.0 => /lib/x86_64-linux-gnu/libpixman-1.so.0 (0x00007cb06cd30000)
        libjpeg.so.8 => /lib/x86_64-linux-gnu/libjpeg.so.8 (0x00007cb06ccad000)
        libmount.so.1 => /lib/x86_64-linux-gnu/libmount.so.1 (0x00007cb06cc60000)
        libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007cb06cc31000)
        libffi.so.8 => /lib/x86_64-linux-gnu/libffi.so.8 (0x00007cb06cc25000)
        libpcre2-8.so.0 => /lib/x86_64-linux-gnu/libpcre2-8.so.0 (0x00007cb06cb8b000)
        libXft.so.2 => /lib/x86_64-linux-gnu/libXft.so.2 (0x00007cb06cb70000)
        libXss.so.1 => /lib/x86_64-linux-gnu/libXss.so.1 (0x00007cb06cb6b000)
        /lib64/ld-linux-x86-64.so.2 (0x00007cb06eb18000)
        libgraphite2.so.3 => /lib/x86_64-linux-gnu/libgraphite2.so.3 (0x00007cb06cb43000)
        libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007cb06cb17000)
        libatspi.so.0 => /lib/x86_64-linux-gnu/libatspi.so.0 (0x00007cb06cadd000)
        libdbus-1.so.3 => /lib/x86_64-linux-gnu/libdbus-1.so.3 (0x00007cb06ca8e000)
        libdatrie.so.1 => /lib/x86_64-linux-gnu/libdatrie.so.1 (0x00007cb06ca83000)
        libbrotlidec.so.1 => /lib/x86_64-linux-gnu/libbrotlidec.so.1 (0x00007cb06ca75000)
        libXau.so.6 => /lib/x86_64-linux-gnu/libXau.so.6 (0x00007cb06ca6f000)
        libXdmcp.so.6 => /lib/x86_64-linux-gnu/libXdmcp.so.6 (0x00007cb06ca67000)
        libblkid.so.1 => /lib/x86_64-linux-gnu/libblkid.so.1 (0x00007cb06ca2c000)
        libsystemd.so.0 => /lib/x86_64-linux-gnu/libsystemd.so.0 (0x00007cb06c94a000)
        libbrotlicommon.so.1 => /lib/x86_64-linux-gnu/libbrotlicommon.so.1 (0x00007cb06c927000)
        libbsd.so.0 => /lib/x86_64-linux-gnu/libbsd.so.0 (0x00007cb06c911000)
        libcap.so.2 => /lib/x86_64-linux-gnu/libcap.so.2 (0x00007cb06c904000)
        libgcrypt.so.20 => /lib/x86_64-linux-gnu/libgcrypt.so.20 (0x00007cb06c7bc000)
        liblz4.so.1 => /lib/x86_64-linux-gnu/liblz4.so.1 (0x00007cb06c798000)
        libzstd.so.1 => /lib/x86_64-linux-gnu/libzstd.so.1 (0x00007cb06c6de000)
        libmd.so.0 => /lib/x86_64-linux-gnu/libmd.so.0 (0x00007cb06c6cf000)
        libgpg-error.so.0 => /lib/x86_64-linux-gnu/libgpg-error.so.0 (0x00007cb06c6aa000) */