#!/bin/bash

echo \\section{Hele landet} > resultater.tex

for i in `seq 1 24`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Østfold} >> resultater.tex

for i in `seq 25 38`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Akershus} >> resultater.tex

for i in `seq 39 52`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Hedmark} >> resultater.tex

for i in `seq 53 65`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Oppland} >> resultater.tex

for i in `seq 66 78`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Buskerud} >> resultater.tex

for i in `seq 79 92`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Vestfold} >> resultater.tex

for i in `seq 93 106`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Telemark} >> resultater.tex

for i in `seq 107 119`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Aust-Agder} >> resultater.tex

for i in `seq 120 132`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Vest-Agder} >> resultater.tex

for i in `seq 133 146`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Rogaland} >> resultater.tex

for i in `seq 147 161`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Hordaland} >> resultater.tex

for i in `seq 162 176`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Sogn og Fjordane} >> resultater.tex

for i in `seq 177 187`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Møre og Romsdal} >> resultater.tex

for i in `seq 188 199`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Sør-Trøndelag} >> resultater.tex

for i in `seq 200 213`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Nord-Trøndelag} >> resultater.tex

for i in `seq 214 225`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Nordland} >> resultater.tex

for i in `seq 226 240`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Troms} >> resultater.tex

for i in `seq 241 253`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done

echo \\section{Finnmark} >> resultater.tex

for i in `seq 254 265`;
do
    echo '\includegraphics[page='$i',width=\bredde]{resultater}' >> resultater.tex
done
