// Including dependancies
#include <iostream>
#include <string>
#include <cmath>
using namespace std;
// Array to hold 16 keys
string round_keys[16];
// String to hold the plain text
string pt;
// Function to convert a number in decimal to binary
string convertDecimalToBinary(int decimal)
{
	string binary;
    while(decimal != 0) {
		binary = (decimal % 2 == 0 ? "0" : "1") + binary; 
		decimal = decimal/2;
	}
	while(binary.length() < 4){
		binary = "0" + binary;
	}
    return binary;
}
// Function to convert a number in binary to decimal
int convertBinaryToDecimal(string binary)
{
    int decimal = 0;
	int counter = 0;
	int size = binary.length();
	for(int i = size-1; i >= 0; i--)
	{
    	if(binary[i] == '1'){
        	decimal += pow(2, counter);
    	}
    counter++;
	}
	return decimal;
}
string convertBinaryToHexadecimal(string binary){
	string hexDigits = "0123456789ABCDEF";
    string hexResult = "";

    // Convert each 4-bit chunk to a hexadecimal digit
    for (size_t i = 0; i < binary.size(); i += 4) {
        string chunk = binary.substr(i, 4);
        int decimal = stoi(chunk, nullptr, 2);
        hexResult += hexDigits[decimal];
    }
	return hexResult;
}
string convertHexadecimalToBinary(string hex) {
    // Define a lookup table for hexadecimal to binary conversion
    string hexDigits = "0123456789ABCDEF";
    string binaryDigits[] = {"0000", "0001", "0010", "0011",
                                        "0100", "0101", "0110", "0111",
                                        "1000", "1001", "1010", "1011",
                                        "1100", "1101", "1110", "1111"};
    // Convert each hexadecimal digit to its binary representation
    string binaryResult;
    for (char c : hex) {
        // Find the index of the hexadecimal digit in the lookup table
        size_t index = hexDigits.find(toupper(c));
        if (index != string::npos) {
            binaryResult += binaryDigits[index];
        } else {
            // Handle invalid characters in the hexadecimal string
            cerr << "Error: Invalid hexadecimal character '" << c << "'" << endl;
            return "";
        }
    }
    return binaryResult;
}
// Function to do a circular left shift by 1
string shift_left_once(string key_chunk){ 
    string shifted="";  
        for(int i = 1; i < 28; i++){ 
            shifted += key_chunk[i]; 
        } 
        shifted += key_chunk[0];   
    return shifted; 
} 
// Function to do a circular left shift by 2
string shift_left_twice(string key_chunk){ 
    string shifted=""; 
    for(int i = 0; i < 2; i++){ 
        for(int j = 1; j < 28; j++){ 
            shifted += key_chunk[j]; 
        } 
        shifted += key_chunk[0]; 
        key_chunk= shifted; 
        shifted =""; 
    } 
    return key_chunk; 
}
// Function to compute xor between two strings
string Xor(string a, string b){ 
	string result = ""; 
	int size = b.size();
	for(int i = 0; i < size; i++){ 
		if(a[i] != b[i]){ 
			result += "1"; 
		}
		else{ 
			result += "0"; 
		} 
	} 
	return result; 
} 

// Function to generate the 16 keys.
void generate_keys(string key){
	// The PC1 table
	int pc1[56] = {
	57,49,41,33,25,17,9, 
	1,58,50,42,34,26,18, 
	10,2,59,51,43,35,27, 
	19,11,3,60,52,44,36,		 
	63,55,47,39,31,23,15, 
	7,62,54,46,38,30,22, 
	14,6,61,53,45,37,29, 
	21,13,5,28,20,12,4 
	};
	// The PC2 table
	int pc2[48] = { 
	14,17,11,24,1,5, 
	3,28,15,6,21,10, 
	23,19,12,4,26,8, 
	16,7,27,20,13,2, 
	41,52,31,37,47,55, 
	30,40,51,45,33,48, 
	44,49,39,56,34,53, 
	46,42,50,36,29,32 
	}; 
	// 1. Compressing the key using the PC1 table
	string perm_key =""; 
	for(int i = 0; i < 56; i++){ 
		perm_key+= key[pc1[i]-1]; 
	} 
	#ifdef DEBUG
		cout << "Key after PC1: " << convertBinaryToHexadecimal(perm_key) << endl;
	#endif
	// 2. Dividing the key into two equal halves
	string left= perm_key.substr(0, 28); 
	string right= perm_key.substr(28, 28); 
	for(int i=0; i<16; i++){ 
		#ifdef DEBUG
			cout << "Round Number: " << i+1 << endl;
			cout << "Initial Left: " << convertBinaryToHexadecimal(left) << endl;
		    cout << "Initial Right: " << convertBinaryToHexadecimal(right) << endl;
		#endif
		// 3.1. For rounds 1, 2, 9, 16 the key_chunks
		// are shifted by one.
		if(i == 0 || i == 1 || i==8 || i==15 ){
			left= shift_left_once(left); 
			right= shift_left_once(right);
			#ifdef DEBUG
				cout << "Left After 1 Shift: " << convertBinaryToHexadecimal(left) << endl;
				cout << "Right After 1 Shift: " << convertBinaryToHexadecimal(right) << endl;
			#endif
		} 
		// 3.2. For other rounds, the key_chunks
		// are shifted by two
		else{
			left= shift_left_twice(left); 
			right= shift_left_twice(right);
			#ifdef DEBUG
				cout << "Left After 2 Shift: " << convertBinaryToHexadecimal(left) << endl;
				cout << "Right After 2 Shift: " << convertBinaryToHexadecimal(right) << endl;
			#endif
		}
		// Combining the two chunks
		string combined_key = left + right;
		#ifdef DEBUG
			cout << "Round Key after combining: " << convertBinaryToHexadecimal(combined_key) << endl;
	    #endif
		string round_key = ""; 
		// Finally, using the PC2 table to transpose the key bits
		for(int i = 0; i < 48; i++){ 
			round_key += combined_key[pc2[i]-1]; 
		}   
		round_keys[i] = round_key; 
		#ifdef DEBUG
			cout << "Round Key after PC2: " << convertBinaryToHexadecimal(round_key) << endl;
		#endif 
	} 

}

void reverseKeys(){
	// Reversing the round_keys array for decryption
	int i = 15;
	int j = 0;
	while(i > j)
	{
		string temp = round_keys[i];
	    round_keys[i] = round_keys[j];
		round_keys[j] = temp;
		i--;
		j++;
	}
}
// Implementing the algorithm
string DES(){ 
	// The initial permutation table 
	int initial_permutation[64] = { 
	58,50,42,34,26,18,10,2, 
	60,52,44,36,28,20,12,4, 
	62,54,46,38,30,22,14,6, 
	64,56,48,40,32,24,16,8, 
	57,49,41,33,25,17,9,1, 
	59,51,43,35,27,19,11,3, 
	61,53,45,37,29,21,13,5, 
	63,55,47,39,31,23,15,7 
	}; 
	// The expansion table
	int expansion_table[48] = { 
	32,1,2,3,4,5,4,5, 
	6,7,8,9,8,9,10,11, 
	12,13,12,13,14,15,16,17, 
	16,17,18,19,20,21,20,21, 
	22,23,24,25,24,25,26,27, 
	28,29,28,29,30,31,32,1 
	}; 
	// The substitution boxes. The should contain values
	// from 0 to 15 in any order.
	int substition_boxes[8][4][16]=  
	{{ 
        14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7, 
        0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8, 
        4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0, 
        15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13 
    }, 
    { 
        15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10, 
        3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5, 
        0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15, 
        13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9 
    }, 
    { 
        10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8, 
        13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1, 
        13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7, 
        1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12 
    }, 
    { 
        7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15, 
        13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9, 
        10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4, 
        3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14 
    }, 
    { 
        2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9, 
        14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6, 
        4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14, 
        11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3 
    }, 
    { 
        12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11, 
        10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8, 
        9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6, 
        4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13 
    }, 
    { 
        4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1, 
        13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6, 
        1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2, 
        6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12 
    }, 
    { 
        13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7, 
        1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2, 
        7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8, 
        2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11 
    }};
	// The permutation table
	int permutation_tab[32] = { 
	16,7,20,21,29,12,28,17, 
	1,15,23,26,5,18,31,10, 
	2,8,24,14,32,27,3,9,
	19,13,30,6,22,11,4,25 
	}; 
	// The inverse permutation table
	int inverse_permutation[64]= { 
	40,8,48,16,56,24,64,32, 
	39,7,47,15,55,23,63,31, 
	38,6,46,14,54,22,62,30, 
	37,5,45,13,53,21,61,29, 
	36,4,44,12,52,20,60,28, 
	35,3,43,11,51,19,59,27, 
	34,2,42,10,50,18,58,26, 
	33,1,41,9,49,17,57,25 
	};
	//1. Applying the initial permutation
  	string perm = ""; 
	for(int i = 0; i < 64; i++){ 
		perm += pt[initial_permutation[i]-1]; 
	} 
	#ifdef DEBUG
		cout << "After Initial Permuatation: " << convertBinaryToHexadecimal(perm) << endl; 
	#endif
	// 2. Dividing the result into two equal halves 
	string left = perm.substr(0, 32); 
	string right = perm.substr(32, 32);
	// The plain text is encrypted 16 times  
	for(int i=0; i<16; i++) { 
    	string right_expanded = ""; 
		// 3.1. The right half of the plain text is expanded
		#ifdef DEBUG
			cout << "Round Number: " << i+1<< endl;
			cout << "Left: " << convertBinaryToHexadecimal(left) << endl;
			cout << "Right: " << convertBinaryToHexadecimal(right) << endl;
		#endif
    	for(int i = 0; i < 48; i++) { 
      		right_expanded += right[expansion_table[i]-1]; 
    	};  // 3.3. The result is xored with a key
		#ifdef DEBUG
			cout << "Right Expansion: " << convertBinaryToHexadecimal(right_expanded) <<endl;
			cout << "F function key: "<< convertBinaryToHexadecimal(round_keys[i]) << endl;
		#endif
		string xored = Xor(round_keys[i], right_expanded);  
		string res = ""; 
		#ifdef DEBUG
			cout << "Result of Key and Right Expanded XOR: " << convertBinaryToHexadecimal(xored) << endl;
		#endif
		// 3.4. The result is divided into 8 equal parts and passed 
		// through 8 substitution boxes. After passing through a 
		// substituion box, each box is reduces from 6 to 4 bits.
		#ifdef DEBUG
			cout << "Result of Key and Right Expanded XOR: " << convertBinaryToHexadecimal(xored) << endl;
			cout << "Eight 6-bit slices to index S-Boxes:\n";
			for (int i=0; i < 47; i += 6){
				cout << xored.substr(i,6) << endl;
			}
		#endif
		for(int i=0;i<8; i++){ 
			// Finding row and column indices to lookup the
			// substituition box
      		string row1= xored.substr(i*6,1) + xored.substr(i*6 + 5,1);
      		int row = convertBinaryToDecimal(row1);
      		string col1 = xored.substr(i*6 + 1,1) + xored.substr(i*6 + 2,1) + xored.substr(i*6 + 3,1) + xored.substr(i*6 + 4,1);;
			int col = convertBinaryToDecimal(col1);
			#ifdef DEBUG
				cout << "S-Box " << i << ": Row " << convertBinaryToHexadecimal(convertDecimalToBinary(row)) << " Column " << convertBinaryToHexadecimal(convertDecimalToBinary(col)) <<endl;
			#endif
			int val = substition_boxes[i][row][col];
			#ifdef DEBUG
				cout << "S-Box " << i << " Output: " << convertBinaryToHexadecimal(convertDecimalToBinary(val)) << endl;
			#endif
			res += convertDecimalToBinary(val);  
		} 
		// 3.5. Another permutation is applied
		#ifdef DEBUG
			cout << "After SBOX subsititution: " << convertBinaryToHexadecimal(res) << endl;
		#endif
		string perm2 =""; 
		for(int i = 0; i < 32; i++){ 
			perm2 += res[permutation_tab[i]-1]; 
		}
		#ifdef DEBUG
			cout << "After permutation, F function output of Round " << i+1<< ": "<< convertBinaryToHexadecimal(perm2) << endl;
		#endif
		// 3.6. The result is xored with the left half
		xored = Xor(perm2, left);
		#ifdef DEBUG
			cout << "Result of F function output and Left half XOR: " << convertBinaryToHexadecimal(xored) << endl;
		#endif
		// 3.7. The left and the right parts of the plain text are swapped 
		left = xored; 
		if(i < 15){ 
			string temp = right;
			right = xored;
			left = temp;
		} 
		#ifdef DEBUG
			cout << "Final left: " << convertBinaryToHexadecimal(left) << endl; 
			cout << "Final right: " << convertBinaryToHexadecimal(right) << endl; 
		#endif
	} 
	// 4. The halves of the plain text are applied
	string combined_text = left + right;
	#ifdef DEBUG
		cout << "Combined output before inverse permutation: " << convertBinaryToHexadecimal(combined_text) << endl; 
	#endif   
	string ciphertext =""; 
	// The inverse of the initial permuttaion is applied
	for(int i = 0; i < 64; i++){ 
		ciphertext+= combined_text[inverse_permutation[i]-1]; 
	}
	//And we finally get the cipher text
	return ciphertext; 
}

int main(int argc, char *argv[]){ 
	// A 64 bit key
	string key= convertHexadecimalToBinary(argv[2]);
	// A block of plain text of 64 bits
	pt= convertHexadecimalToBinary(argv[1]);
	// Calling the function to generate 16 keys

  	generate_keys(key); 

	#ifdef DECRYPT
		reverseKeys();
	#endif

    cout<<"Plain Text: "<<convertBinaryToHexadecimal(pt)<<endl; 
	cout<<"Cipher Key: " <<convertBinaryToHexadecimal(key)<<endl;
	#ifdef DEBUG
		for (int i = 0; i < 16; i++){
			cout << "Key " << i+1 << ": " << convertBinaryToHexadecimal(round_keys[i]) << endl;
		}
	#endif
	// Applying the algo
    string ct= DES(); 
    cout<<"Cipher Text: "<<convertBinaryToHexadecimal(ct)<<endl;
} 