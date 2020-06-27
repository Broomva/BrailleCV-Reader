function BRAILLE=pasarbraille(letracalculada)
prefijo=[ 0 1 ; 0 1 ; 1 1 ];
  if letracalculada=='A'
                letracalculada
            BRAILLE=[1 0 ; 0 0 ; 0 0]
            elseif letracalculada=='B'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 0 0]
            elseif letracalculada=='C'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 0 0]
            elseif letracalculada=='D'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 0 0]
            elseif letracalculada=='E'
                letracalculada
            BRAILLE=[1 0 ; 0 1 ; 0 0]
            elseif letracalculada=='F'
                letracalculada
            BRAILLE=[1 1 ; 1 0 ; 0 0]
            elseif letracalculada=='G'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 0 0]
            elseif letracalculada=='H'
                letracalculada
            BRAILLE=[1 0 ; 1 1 ; 0 0]
            elseif letracalculada=='I'
                letracalculada
            BRAILLE=[0 1 ; 1 0 ; 0 0]
            elseif letracalculada=='J'
                letracalculada
            BRAILLE=[0 1 ; 1 1 ; 0 0]
            elseif letracalculada=='K'
                letracalculada
            BRAILLE=[1 0 ; 0 0 ; 1 0]
            elseif letracalculada=='L'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 1 0]
            elseif letracalculada=='M'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 1 0]
            elseif letracalculada=='N'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 1 0]
            elseif letracalculada=='O'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 0 0]
            elseif letracalculada=='P'
                letracalculada
            BRAILLE=[1 1 ; 1 0 ; 1 0]
            elseif letracalculada=='Q'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 1 0]
            elseif letracalculada=='R'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 1 0]
            elseif letracalculada=='S'
                letracalculada
            BRAILLE=[0 1 ; 1 0 ; 1 0]
            elseif letracalculada=='T'
                letracalculada
            BRAILLE=[0 1 ; 1 1 ; 1 0]
            elseif letracalculada=='U'
                letracalculada
            BRAILLE=[1 0; 0 0 ; 1 1]
            elseif letracalculada=='V'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 1 1]
            elseif letracalculada=='W'
                letracalculada
            BRAILLE=[0 1; 0 1 ; 0 1]
            elseif letracalculada=='X'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 1 1]
            elseif letracalculada=='Y'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 1 1]
            elseif letracalculada=='Z'
                letracalculada
            BRAILLE=[1 0 ; 0 1 ; 1 1]
            
            
            %-------numeros-------------%
           
            elseif letracalculada=='1'
                letracalculada
            BRAILLE=[prefijo [1 0 ; 0 0 ; 0 0]]
            elseif letracalculada=='2'
                letracalculada
            BRAILLE=[prefijo [1 0 ; 1 0 ; 0 0]]
            
            elseif letracalculada=='3'
                letracalculada
            BRAILLE=[prefijo [1 1 ; 0 0 ; 0 0]]
            
            elseif letracalculada=='4'
                letracalculada
            BRAILLE=[prefijo [1 1 ; 0 1 ; 0 0]]
            
            elseif letracalculada=='5'
                letracalculada
            BRAILLE=[prefijo [1 0 ; 0 1 ; 0 0]]
            
            elseif letracalculada=='6'
                letracalculada
           BRAILLE=[prefijo ,[1 1 ; 1 0 ; 0 0]]
            
            elseif letracalculada=='7'
                letracalculada
            BRAILLE=[prefijo [1 1 ; 1 1 ; 0 0]]
            
            elseif letracalculada=='8'
                letracalculada
            BRAILLE=[prefijo [1 0 ; 1 1 ; 0 0]]
            
            elseif letracalculada=='9'
                letracalculada
            BRAILLE=[prefijo [0 1 ; 1 0 ; 0 0]]
            
            elseif letracalculada=='0'
                letracalculada
            BRAILLE=[prefijo [0 1 ; 1 1 ; 0 0]]
            
            
  end
end
