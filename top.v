module top (
input [15:0]sw,
input btnC, btnR, btnL, btnD, btnU,
output [15:0]led
);

wire [1:0]personVar;
assign personVar[0] = btnL;
assign personVar[1] = btnU;
wire [1:0]locationVar;
assign locationVar[0] = btnD;
assign locationVar[1] = btnR;
wire [3:0] infoCable;

mux_4_bits insta_mux(
.CEO(sw[3:0]),
.You(sw[7:4]),
.Fred(sw[11:8]),
.Jill(sw[15:12]),
.Enable(btnC),
.Sel(personVar),
.Y(infoCable)
);

demux_4_bits insta_demux(
.local_lib(led[3:0]),
.fire_dept(led[7:4]),
.school(led[11:8]),
.rib_shack(led[15:12]),
.Enable(btnC),
.Sel(locationVar),
.Y(infoCable)
);
endmodule

module mux_4_bits(
    input [3:0]CEO,
    input [3:0]You,
    input [3:0]Fred,
    input [3:0]Jill,
    input Enable,
    input [1:0] Sel,
    output [3:0] Y
);

    assign Y = Enable ? (Sel == 0? CEO:
                         Sel == 1? You:
                         Sel == 2? Fred:
                         Sel == 3? Jill: 0):0;

endmodule

module demux_4_bits(
input [1:0]Sel, 
input Enable,
input [3:0] Y,
output [3:0] local_lib, fire_dept, school, rib_shack
);

assign local_lib = (Sel == 0) & Enable ? Y: 0;
assign fire_dept = (Sel == 1) & Enable ? Y: 0;
assign school = (Sel == 2) & Enable ? Y: 0;
assign rib_shack = (Sel == 3) & Enable ? Y: 0;
endmodule








