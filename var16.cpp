#include <iostream>
#include <ctime>
using namespace std;
int main()
{
	 srand(time(0));
	 long long n = rand() % 9 + 2;
	 long long *array = new long long[n];
/*	 for (int i = 0; i < n; i++)
	{
		array[i] = 0;
		cout<<array[i];
	}*/
	 long long *ptr_array = &array[0];
	 long long *end_array = &array[n-1];
//	 cout<<endl<<"end array = "<<end_array<<endl;
//	 cout<<endl<<"ptr array = "<<ptr_array<<endl;
	 if (n<=1)
	 {
	 cout<< "Bad array size!"<<endl;
	 return -1;
	 }
	 asm(
	"mov %[n], %%rax\n\t" 
	"mov %[ptr_array], %%rbx\n\t"
	"mov %[end_array], %%rcx\n\t" 
	"mov $1, %%rdx\n\t" 
	"loop_start:\n\t"
		"mov %%rdx, (%%rbx)\n\t"
		"mov %%rdx, (%%rcx)\n\t"
		"inc %%rdx\n\t"
		"dec %%rax\n\t"
		"jz end_asm\n\t"
		"add $8, %%rbx\n\t"
		"cmp %%rbx, %%rcx\n\t"
		"je end_asm\n\t"
		"mov %%rdx, (%%rbx)\n\t"
		"sub $8, %%rcx\n\t"
		"cmp %%rbx, %%rcx\n\t"
		"je end_asm\n\t"
		"jmp loop_start\n\t"
	 
	 "end_asm:\n\t"
	 :
	 :[ptr_array]"m"(ptr_array), [end_array]"m"(end_array), [n]"m"(n)
	 :"%rax", "%rbx", "%rcx", "%rdx"
	 );
	 cout<<endl<<"--------------------------------"<<endl;
	 cout<<"\tArray"<<endl;
	 for (int i = 0; i < n; i++)
	 {
	 
		cout<<array[i]<<" ";
	 
	 }
	 delete [] array;
	 cout<<endl<<"--------------------------------"<<endl;
	 return 0;
}