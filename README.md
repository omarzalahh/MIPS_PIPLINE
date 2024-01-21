# MIPS_PIPLINE
Pipelining is a powerful way to improve the throughput of a digital system. We design a pipelined processor by subdividing the single-cycle processor into five pipeline stages. Thus, five instructions can execute simultaneously, one in each stage. Because each stage has only one-fifth of the entire logic, the clock frequency is almost five times faster. Hence, the latency of each instruction is ideally unchanged, but the throughput is ideally five times better. Microprocessors execute millions or billions of instructions per second, so throughput is more important than latency. Pipelining introduces some overhead, so the throughput will not be quite as high as we might ideally desire, but pipelining nevertheless gives such great advantage for so little cost that all modern high-performance microprocessors are pipelined. Reading and writing the memory and register file and using the ALU typically constitute the biggest delays in the processor. We choose five pipeline stages so that each stage involves exactly one of these slow steps. Specifically, we call the five stages Fetch, Decode, Execute, Memory, and Writeback. They are similar to the five steps that the multicycle processor used to perform lw. In the Fetch stage, the processor reads the instruction from instruction memory. In the Decode stage, the processor reads the source operands from the register file and decodes the instruction to produce the control signals. In the Execute stage, the processor performs a computation with the ALU. In the Memory stage, the processor reads or writes data memory. Finally, in the Writeback stage, the processor writes the result to the register file, when applicable.![EDA - VMware Workstation 14_09_2022 09_41_16 م](https://user-images.githubusercontent.com/82718853/190250405-1ca5a619-9f7c-4ca0-ba43-8d5de3a2ae24.png)

![EDA - VMware Workstation 14_09_2022 09_41_27 م](https://user-images.githubusercontent.com/82718853/190250395-979dcb30-a6f1-49bf-a521-e3ab41c9fd9b.png)

![EDA - VMware Workstation 14_09_2022 09_40_59 م](https://user-images.githubusercontent.com/82718853/190250426-2bb2623a-4332-439a-bda8-54b7a9b375dd.png)


first three photos about Control unit mapping
Then mapping Data path and top module

![EDA - VMware Workstation 14_09_2022 09_42_41 م](https://user-images.githubusercontent.com/82718853/190250805-74d564b5-c048-4bee-b4a8-d32d75b28efa.png)
![EDA - VMware Workstation 14_09_2022 09_42_36 م](https://user-images.githubusercontent.com/82718853/190250822-34158dc0-51fb-4d2c-86a9-cbbc721002fa.png)
![EDA - VMware Workstation 14_09_2022 09_42_24 م](https://user-images.githubusercontent.com/82718853/190250846-36853d8e-d3f8-49b1-b156-dbd5a9f8c48f.png)
![EDA - VMware Workstation 14_09_2022 09_42_19 م](https://user-images.githubusercontent.com/82718853/190250866-48e775c2-3eb8-4531-b58e-df4191a4af7d.png)
![EDA - VMware Workstation 14_09_2022 09_42_07 م](https://user-images.githubusercontent.com/82718853/190250899-ef856a4d-6b23-40a5-a8ae-1a2b3b3fa8f5.png)
![EDA - VMware Workstation 14_09_2022 09_41_55 م](https://user-images.githubusercontent.com/82718853/190250920-014d6242-c5c2-4aa8-8161-2e2cac643386.png)
![EDA - VMware Workstation 14_09_2022 09_46_36 م](https://user-images.githubusercontent.com/82718853/190250943-7b2fb257-a99d-4890-b62d-b9df55d9396a.png)

