; gdt.asm

;;; gdt_start and gdt_end labels are used to compute size

; null segment descriptor
gdt_start:
    dq 0x0

; code segment descriptor
gdt_code:
    dw 0xffff   ; segment length, bits 0-15
    dw 0x0      ; base address, bits 0-15
    db 0x0      ; base address, bits 16-23
    db 10011010b; access byte: flags (8 bits)
    db 11001111b; flags (4 bits) + segment length, bits 16-19
    db 0x0      ; base address, bits 24-31

; data segment descriptor
gdt_data:
    dw 0xffff   ; segment length, bits 0-15
    dw 0x0      ; segment address, bits 0-15
    db 0x0      ; segment address, bits 16-23
    db 10010010b; access byte: flags (8 bits)
    db 11001111b; flags (4 bits) + segment length, bits 16-19
    db 0x0      ; segment address, bits 24-31

gdt_end:

; GDT descriptor
gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; size of GDT (16 bits)
    dq gdt_start ; base address of GDT (32 bits)

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start