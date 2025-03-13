`timescale 1ns / 100ps //Define unidade de tempo e precisão 
							  //`timescale <unidade de tempo> / <precisão de tempo>

//Define que todas as constantes do código (como #10) são interpretadas como nanosegundos


module tb_fulladder;
    // 1. Declarar variáveis do testbench
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
    integer i;

    // 2. Instanciar DUT e conectar variáveis
    fulladd fa0 (
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .sum(sum)
    );

    // 3. Definir o stimulus, i.e, sinais de controle e entradas para o DUT
    initial begin
        // Inicializa inputs
        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;

        // Monitorar valores no console
        $monitor ("Time=%0t | a=0x%0h b=0x%0h c_in=0x%0h c_out=0x%0h sum=0x%0h", 
                   $time, a, b, c_in, c_out, sum);

        // Aplicar valores randômicos aos sinais de entrada
        for (i = 0; i < 5; i = i + 1) begin
            #10 a = $random & 4'hF;   // Garante que `a` tem no máximo 4 bits
                b = $random & 4'hF;   // Garante que `b` tem no máximo 4 bits
                c_in = $random & 1'b1; // Garante que `c_in` é 0 ou 1
        end

        #50;  // Esperar antes de finalizar
        $stop;  // Finalizar Simulação
    end
endmodule
