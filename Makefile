

# mandel_test.gcc_O0.exe

ocaml: mandel_test.ocaml.exe
mandel_test.ocaml.exe: mandel_test.ml
	ocamlopt -ccopt -O3 -noassert -unsafe -nodynlink -inline 100 $^ -o $@

racket:
	echo '(time (main))' | racket mandel_test.ss


clean:
	rm -f *.o *.cmx *.cmx *.cmi *.hi \#*\# .\#*



