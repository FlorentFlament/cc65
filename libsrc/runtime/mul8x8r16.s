;
; Ullrich von Bassewitz, 2010-11-02
;
; CC65 runtime: 8x8 => 16 multiplication
;

       	.export		mul8x8r16, umul8x8r16
    	.importzp	ptr1, ptr3


;---------------------------------------------------------------------------
; 8x8 => 16 multiplication routine.
;
;   lhs         rhs           result          result also in
; -------------------------------------------------------------
;   ptr1-lo     ptr3-lo         a/x             ptr1
;

mul8x8r16:
umul8x8r16:
    	lda   	#0              ; Clear byte 1
       	ldy    	#8    	       	; Number of bits
        lsr     ptr1            ; Get first bit of lhs into carry
@L0:    bcc     @L1
        clc
        adc     ptr3
@L1:    ror
        ror     ptr1
        dey
        bne     @L0
        tax         
        stx     ptr1+1          ; Result in a/x and ptr1
    	lda	ptr1  	       	; Load the result
    	rts	   		; Done
