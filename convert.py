def convert_mem_to_verilog(mem_file_path, output_file_path):
    try:
        # Open the .mem file for reading
        with open(mem_file_path, 'r') as mem_file:
            # Read all the lines (each line is a binary value)
            mem_lines = mem_file.readlines()

        # Open the output file for writing
        with open(output_file_path, 'w') as verilog_file:
            # Iterate through each line and convert to Verilog format
            for i, line in enumerate(mem_lines):
                # Remove any extra whitespace or newline characters
                value = line.strip()
                
                # Write the Verilog format
                verilog_file.write(f"memory[{i}] = 9'b{value};\n")

        print(f"Conversion completed. Verilog output written to {output_file_path}")
    
    except FileNotFoundError:
        print(f"Error: The file {mem_file_path} was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
convert_mem_to_verilog("bscfsrgold.mem", "bscfsrgold1.mem")
