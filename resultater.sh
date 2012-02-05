#!/bin/bash

echo \\section{Hele landet} > resultater.tex

for i in `seq 1 24`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Østfold} >> resultater.tex

for i in `seq 25 38`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Akershus} >> resultater.tex

for i in `seq 39 52`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Hedmark} >> resultater.tex

for i in `seq 71 83`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Oppland} >> resultater.tex

for i in `seq 84 96`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Buskerud} >> resultater.tex

for i in `seq 97 110`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Vestfold} >> resultater.tex

for i in `seq 111 124`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Telemark} >> resultater.tex

for i in `seq 125 137`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Aust-Agder} >> resultater.tex

for i in `seq 138 150`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Vest-Agder} >> resultater.tex

for i in `seq 151 164`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Rogaland} >> resultater.tex

for i in `seq 165 179`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Hordaland} >> resultater.tex

for i in `seq 180 194`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Sogn og Fjordane} >> resultater.tex

for i in `seq 195 205`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Møre og Romsdal} >> resultater.tex

for i in `seq 206 217`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Sør-Trøndelag} >> resultater.tex

for i in `seq 218 231`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Nord-Trøndelag} >> resultater.tex

for i in `seq 232 243`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Nordland} >> resultater.tex

for i in `seq 244 258`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Troms} >> resultater.tex

for i in `seq 259 271`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done

echo \\section{Finnmark} >> resultater.tex

for i in `seq 272 283`;
do
    echo '\includegraphics[page='$i',width=0.5\textwidth]{resultater}' >> resultater.tex
done
