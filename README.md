#Binary-to-Gray Code Converter in Verilog

#Overview

In this project, I implemented a parameterized N-bit binary-to-Gray code converter in Verilog using structural modeling. My goal was to create a circuit that converts an N-bit binary number to its equivalent Gray code, where each output bit is derived by XORing adjacent input bits, except for the MSB, which is copied directly. For example, with a 4-bit input (N=4), if the input is 0100 (binary 4), the output is 0110 (Gray code). I used a generate loop with XOR gates for the conversion and wrote a testbench to verify the functionality for a 4-bit input by testing all possible binary inputs. I confirmed the design works as expected through simulation.

Module: binary_to_gray





What I Did: I designed a converter that transforms an N-bit binary input to an N-bit Gray code output.



Parameters:





N: Number of input/output bits (default: 4).



Inputs:





in[N-1:0]: N-bit binary input.



Outputs:





out[N-1:0]: N-bit Gray code output.



How It Works:





I copied the MSB directly: out[N-1] = in[N-1] using a buffer (buf).



For the remaining bits (out[i] where i from 0 to N-2), I used XOR gates: out[i] = in[i] XOR in[i+1].



I implemented the XOR operations using a generate loop with a genvar to create N-1 XOR gates, each computing one output bit.



For example, for N=4 and in=0100:





out[3] = in[3] = 0



out[2] = in[2] XOR in[3] = 1 XOR 0 = 1



out[1] = in[1] XOR in[2] = 0 XOR 1 = 1



out[0] = in[0] XOR in[1] = 0 XOR 0 = 0



Output: 0110



Style: Structural modeling with buffer and XOR gates.

Testbench: testbench





What I Did: I created a testbench to verify the 4-bit binary-to-Gray code converter (N=4).



How It Works:





I defined a 4-bit input in and a 4-bit output out.



I used a for loop to iterate through all possible inputs (in from 0 to 15, or 0000 to 1111 in binary).



Each test case runs for 10ns, and I used $display to print the input (in) and output (out) in binary format.



The testbench covers all 16 possible inputs for N=4.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: My testbench ensures the converter correctly transforms each binary input to its corresponding Gray code.

Files





binary_to_gray.v: Verilog module for the N-bit binary-to-Gray code converter.



testbench.v: Testbench for simulation (configured for N=4).

Circuit Diagram

Below is the circuit diagram for the 4-bit binary-to-Gray code converter.


![The-circuit-diagram-of-4-bit-binary-to-gray-code-converter](https://github.com/user-attachments/assets/dedca630-f454-4b29-8ea9-a6f2bb904e81)


Simulation Waveform

Below is the simulation waveform, showing input in[3:0] and output out[3:0] over time.


![Screenshot 2025-06-09 204535](https://github.com/user-attachments/assets/c34d7ff5-4683-4d77-95a0-be0f7be881bf)


Console Output

Below is the console output from my testbench simulation.


![Screenshot 2025-06-09 204555](https://github.com/user-attachments/assets/69bc01e2-7630-42af-8123-a094c58ab7dd)






input=0000 output=0000



input=0001 output=0001



input=0010 output=0011



input=0011 output=0010



input=0100 output=0110



input=0101 output=0111



input=0110 output=0101



input=0111 output=0100



input=1000 output=1100



input=1001 output=1101



input=1010 output=1111



input=1011 output=1110



input=1100 output=1010



input=1101 output=1011



input=1110 output=1001



input=1111 output=1000







#Gray-to-Binary Code Converter in Verilog

##Overview

In this project, I implemented a parameterized N-bit Gray-to-binary code converter in Verilog using structural modeling. My goal was to create a circuit that converts an N-bit Gray code input to its equivalent binary number, where each output bit is derived by XORing the current Gray code bit with the higher-order binary output bit, except for the MSB, which is copied directly. For example, with a 4-bit input (N=4), if the Gray code input is 0110, the binary output is 0100 (4 in binary). I used a generate loop with XOR gates for the conversion and wrote a testbench to verify the functionality for a 4-bit input by testing all possible inputs. I confirmed the design works as expected through simulation.

Module: grey_to_binary





What I Did: I designed a converter that transforms an N-bit Gray code input to an N-bit binary output.



Parameters:





N: Number of input/output bits (default: 4).



Inputs:





in[N-1:0]: N-bit Gray code input.



Outputs:





out[N-1:0]: N-bit binary output.



How It Works:





I copied the MSB directly using assign out[N-1] = in[N-1].



For the remaining bits (out[i] where i from N-2 to 0), I used XOR gates: out[i] = out[i+1] XOR in[i].



I implemented the XOR operations using a generate loop with a genvar to create N-1 XOR gates, each computing one output bit by XORing the current Gray code bit with the previously computed binary bit.



For example, for N=4 and in=0110 (Gray code):





out[3] = in[3] = 0



out[2] = out[3] XOR in[2] = 0 XOR 1 = 1



out[1] = out[2] XOR in[1] = 1 XOR 1 = 0



out[0] = out[1] XOR in[0] = 0 XOR 0 = 0



Output: 0100 (binary 4)



Style: Structural modeling with a continuous assignment for the MSB and XOR gates for other bits.

Testbench: testbench





What I Did: I created a testbench to verify the 4-bit Gray-to-binary code converter (N=4).



How It Works:





I defined a 4-bit input in and a 4-bit output out.



I used a for loop to iterate through all possible inputs (in from 0 to 15, or 0000 to 1111), treating each as a potential Gray code input.



Each test case runs for 10ns, and I used $display to print the input (in) and output (out) in binary format.



The testbench covers all 16 possible inputs for N=4.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: My testbench ensures the converter correctly transforms each Gray code input to its corresponding binary output.

Files





grey_to_binary.v: Verilog module for the N-bit Gray-to-binary code converter.



testbench.v: Testbench for simulation (configured for N=4).

Circuit Diagram

Below is the circuit diagram for the 4-bit Gray-to-binary code converter.

![gray to bin](https://github.com/user-attachments/assets/791ad8f1-0d20-4eb1-8269-6fdab731b13e)

Simulation Waveform

Below is the simulation waveform, showing input in[3:0] and output out[3:0] over time.

![Screenshot 2025-06-09 210333](https://github.com/user-attachments/assets/40740c87-ee69-42ce-abc1-ee51f83d5a58)


Console Output

Below is the console output from my testbench simulation.


![Screenshot 2025-06-09 210320](https://github.com/user-attachments/assets/938bcf43-58f2-4827-afd0-dac8b0e8e634)






input=0000 output=0000



input=0001 output=0001



input=0010 output=0011



input=0011 output=0010



input=0100 output=0111



input=0101 output=0110



input=0110 output=0100



input=0111 output=0101



input=1000 output=1111



input=1001 output=1110



input=1010 output=1100



input=1011 output=1101



input=1100 output=1010



input=1101 output=1011



input=1110 output=1001



input=1111 output=1000
