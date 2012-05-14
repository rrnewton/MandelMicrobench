

EXES= mandel_test.fasm_O0.exe mandel_test.fasm_O2.exe \
      mandel_test.llvm_O2.exe                         \
      mandel_test.ocaml.exe                           \
      mandel_test.gcc_O0.exe  mandel_test.gcc_O3.exe

# mandel_test.viaC_O2.exe
# mandel_test2.gcc_O3.exe

all: $(EXES)

gcc:  mandel_test.gcc_O3.exe
ghc1: mandel_test.fasm_O2.exe
ghc2: mandel_test.llvm_O2.exe

#================================================================================

mandel_test.gcc_O3.exe: mandel_test.cpp
	g++ -O3 $^ -o $@

mandel_test.gcc_O0.exe: mandel_test.cpp
	g++ -O0 $^ -o $@

#================================================================================

mandel_test.fasm_O2.exe: mandel_test.hs
	ghc -O2 -fasm --make $^ -o $@ -fforce-recomp

mandel_test.fasm_O0.exe: mandel_test.hs
	ghc -O0 -fasm --make $^ -o $@ -fforce-recomp

mandel_test.llvm_O2.exe: mandel_test.hs
	ghc -O2 -fllvm --make $^ -o $@ -fforce-recomp


#================================================================================

ocaml: mandel_test.ocaml.exe
mandel_test.ocaml.exe: mandel_test.ml
	ocamlopt -ccopt -O3 -noassert -unsafe -nodynlink -inline 100 $^ -o $@

#================================================================================

chez:
	echo '(optimize-level 2) (load "mandel_test.ss") (time (main))' | scheme

racket:
	echo '(load "mandel_test.ss") (time (main))' | racket 

python:
	time python mandel_test.py

#================================================================================

clean:
	rm -f *.o *.cmx *.cmx *.cmi *.hi \#*\# .\#* $(EXES)



