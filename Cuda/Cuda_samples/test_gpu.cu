/* 

Programm to the test if GPU works

*/






#include<stdio.h>



// Funzione esegue la somma di n elementi
__global__ void test_gpu(int *arr , int n , int* sum_gpu ){
	
    int id = threadIdx.x;
	if(id<n){
		int add_factor = 12;
        arr[id] = add_factor;
		atomicAdd( sum_gpu , add_factor);
	}

}
		
int main(){
	

	int n = 5; // number of threads
	int *GpuArr;
	int CpuArr[n];
	int* sum_gpu;
	int sum_cpu = 0;
	cudaMalloc(&GpuArr , sizeof(int) * n);
	cudaMalloc(&sum_gpu , sizeof(int) * 1);

	test_gpu<<<1,n>>>(GpuArr , n , sum_gpu);
	
	cudaMemcpy(CpuArr , GpuArr , sizeof(int) * n , cudaMemcpyDeviceToHost );
	cudaMemcpy(&sum_cpu , sum_gpu , sizeof(int) * 1 , cudaMemcpyDeviceToHost );
	cudaDeviceSynchronize();
	
	int sumTest = 0;
	for ( int i=0 ; i<n ; i++){
		sumTest += CpuArr[i];
	}

	if(sumTest == sum_cpu ){
		printf("Hey la Gpu funziona a dovere!\nBuon lavoro!\n");
	}else{
		printf("ERROR : Comportamento anomalo controllare lo stato della Gpu!");
	}

	return 0;

}