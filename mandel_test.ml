open Complex

let mandel depth c = 
  let rec loop i z = 
     if i == depth         then i 
     else if norm z >= 2.0 then i
     else loop (i+1) (add (mul z z) c)
  in loop 0 {re=0.0; im=0.0};;

print_int (mandel (5 * 1000 * 1000) {re=0.1; im=0.1});;
print_string "\n";;
