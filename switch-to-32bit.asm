; switch_to_32bit.asm

[bits 16]
switch_to_32bit:
    cli         ; 1. disable interrupts
    lgdt [gdt_descriptor] ; 2. load the GDT descriptor
    mov eax, cr0    ; 3. get the current value of CR0
    or eax, 0x1 ; 4. set the PE bit in CR0 : Protected Mode
    mov cr0, eax    ; 5. write the new value to CR0
    jmp CODE_SEG:init_32bit ; 6. far jump to the 32-bit code segment

[bits 32]
init_32bit:
    mov ax, DATA_SEG   ; 1. load the data segment selector
    mov ds, ax     ; 2. set the data segment register
    mov ss, ax     ; 3. set the stack segment register
    mov es, ax    ; 4. set the extra segment register
    mov fs, ax    ; 5. set the fs segment register
    mov gs, ax    ; 6. set the gs segment register

    mov ebp, 0x90000    ; 7. set the stack pointer
    mov esp, ebp    ; 8. set the base pointer

    call BEGIN_32BIT    ; 9. call the 32-bit code in mbr.asm