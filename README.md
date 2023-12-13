# CAOS-MIPT

## Inf01-0
### Задача inf01-0: c/generic/sum-numbers

На стандартном потоке ввода подается последовательно вещественное число x и целое число в 16-ричной записи y.

Единственным аргументов программы является целое число z в 27-ричной системе исчисления.

Необходимо вывести вычислить значение x+y+z и вывести его на стандартный поток вывода с точностью до 3-го знака после точки.

[solution](inf01/inf01-0.c)

## Inf01-1
### Задача inf01-1: generic/ieee754/classify
Реализуйте функцию с прототипом:

``` typedef enum {
    PlusZero      = 0x00,
    MinusZero     = 0x01,
    PlusInf       = 0xF0,
    MinusInf      = 0xF1,
    PlusRegular   = 0x10,
    MinusRegular  = 0x11,
    PlusDenormal  = 0x20,
    MinusDenormal = 0x21,
    SignalingNaN  = 0x30,
    QuietNaN      = 0x31
} float_class_t;

extern float_class_t
classify(double *value_ptr);
```  
которая классифицирует специальные значения вещественного числа, на которое указывает value_ptr, в соответствии со стандартом IEEE 754.

При решении допускается использовать только побитовые операции, включая сдвиги.

[solution](inf01/inf01-1.c)

## Inf02-0
### Задача inf02-0: asm-arm/basics/expression
Реализуйте функцию с меткой f, которая вычисляет значение выражения y=Ax2+Bx+C

Значения A, B, C и x хранятся, соответсвенно, в регистрах r0, r1, r2 и r3.

Результат вычисления выражения сохраните в регистре r0.

Все аргументы и значение выражения представимы 32-разрядными знаковыми целыми числами.

Использовать оперативную память запрещено, - можно использовать только регистры.

__Язык:	arm-gas - arm-linux-gnueabi-as__

[solution](inf02/inf02-0.asm)

## Inf02-1
### Задача inf02-1: asm-arm/basics/memaccess
Реализуйте на языке ассемблера ARM функцию с сигнатурой:

```
 int summ(int x0, int N, int *X) 
```
Функция должна вычислять значение x0+∑xi, где 0≤i<N

__Язык:	arm-gas - arm-linux-gnueabi-as__

[solution](inf02/inf02-1.asm)

## Inf02-2
### Задача inf02-2: asm-arm/basics/globalvars
Реализуйте функцию calculate, которая вычисляет значение выражения: R=(A*B)+(C*D), где A, B, C, и D - это глобальные переменные типа uint32_t, объявленные во внешнем модуле компиляции, а R, - глобальная переменная типа uint32_t в текущем модуле компиляции.

__Язык:	arm-gas - arm-linux-gnueabi-as__

[solution](inf02/inf02-2.asm)

## Inf02-3
### Задача inf02-3: asm-arm/basics/format_io
Реализуйте программу, которая вычисляет сумму двух целых десятичных чисел. Размер типа равен размеру машинного слова.

Можно использовать функции стандартной библиотеки языка Си scanf и printf.

В качестве точки входа можно считать функцию main.

__Язык:	arm-gas - arm-linux-gnueabi-as__

[solution](inf02/inf02-3.asm)

## Inf03-0
### Задача inf03-0: asm-x86/basics
Реализуйте две функции на языке ассемблера x86 (IA-32) или x86-64 с сигнатурами:

```
extern int N;
extern int *A;
extern int *B;
extern int *R;

extern void summ();
extern void everyday795(int X, int Y);
```
      
Первая функция вычисляет значения Ri=Ai+Bi для всех i от 0 до N.

Вторая функция:

1. вводит с клавиатуры знаковое целое число;
2. умножает его на X;
3. прибавляет к нему Y;
4. выводит результат на экран.

[solution](inf03/inf03-0.s)

## Inf03-1
### Задача inf03-1: asm-x86/arrays
Реализуйте функцию на языке ассемблера x86 (IA-32) или x86-64 с сигнатурой:

~~~
extern void summ(int N, const int *A, const int *B, int *R);
~~~
      
Функция вычисляет значения Ri=Ai+Bi для всех i от 0 до N.

Память для хранения массива-результата уже выделена.

[solution](inf03/inf03-1.asm)

## Inf03-2
### Задача inf03-2: asm-x86/mergesort
Реализуйте функцию на языке ассемблера x86-64 с сигнатурой:

```
exten void mergesort(int from, int to, const int *in, int *out);
```
      
Функция выполняет сортировку целых чисел слиянием (Merge Sort).

Параметры from и to - это индексы левой и правой границ областей сортировки; in - исходный массив, out - указатель на выделенную память для хранения результата.

Используйте память только на стеке, использование кучи запрещено.

Для направления ПМФ допускается использование 32-битного ассемблера x86.


__Язык:	gas - GNU Assembler, x86-64, AT&T syntax by default__

[solution](inf03/inf03-2.asm)

## Inf04-0
### Задача inf04-0: posix/syscalls/hello-world
Реализуйте на языке Си программу, которая выводит "Hello, World!".

Использование стандартной библиотеки Си запрещено, единственная доступная функция - это syscall(2).

Точка входа в программу - функция _start.

Для использования syscall можно включить в текст программы следующее объявление:

```
long syscall(long number, ...);
```

Для локального тестирования можно взять реализацию syscall здесь: syscall.S.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf04/inf04-0.c)

## Inf04-1
### Задача inf04-1: posix/syscalls/copy-stream
Реализуйте на языке Си программу, которая копирует содержимое потока ввода на поток вывода.

Использование стандартной библиотеки Си запрещено, единственная доступная функция - это syscall(2).

Точка входа в программу - функция _start.

Для использования syscall можно включить в текст программы следующее объявление:

```
long syscall(long number, ...);
```

Для локального тестирования можно взять реализацию syscall здесь: syscall.S.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf04/inf04-1.c)

## Inf04-2
### Задача inf04-2: asm-x86/syscalls/copy-stream
Реализуйте на языке ассемблера x86_64 программу, которая копирует содержимое со стандартного потока ввода на стандартный поток вывода.

Использование стандартной библиотеки Си запрещено.

Точка входа в программу - функция _start.

__Язык:	gas - GNU Assembler, x86-64, AT&T syntax by default__

[solution](inf04/inf04-2.c)

## Inf05-0
### Задача inf05-0: files-io/read-filter-write
Программе в аргументах командной строки передаются три имени файла. Первый аргумент - входной файл, два остальных - выходные.

Реализуйте программу, которая читает символы из первого файла, во второй файл записывает только цифры, а в третий - всё остальное.

Разрешается использовать только низкоуровневый ввод-вывод POSIX.

Если входной файл не существует, то нужно завершить работу с кодом 1.

Если не возможно создать один из выходных файлов, то завершить работу с кодом 2.

При возникновении других ошибок ввода-вывода - завершить работу с кодом 3.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf05/inf05-0.c)

## Inf05-1
### Задача inf05-1: files-io/print-list-posix
Программе в аргументе командной строки передается имя файла с бинарными данными в Little-Endian.

Файл хранит внутри себя односвязный список элементов:

```
struct Item {
  int value;
  uint32_t next_pointer;
};
```

Поле value храние значение элемента списка, поле next_pointer - позицию в файле (в байтах), указывающую на следующий элемент. Признаком последнего элемента является значение next_pointer, равное 0.

Расположение первого элемента списка (если он существует) - строго в нулевой позиции в файле, расположение остальных - случайным образом.

Выведите на экран через пробел значения элементов в списке в текстовом представлении.

Для работы с файлом использовать только низкоуровневый ввод-вывод POSIX.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf05/inf05-1.c)

## Inf06-0
### Задача inf06-0: posix/mmap/find-substrings-in-file
Программе передаются два аргумента: имя файла, и текстовая строка для поиска.

Необходимо найти все вхождения строки в бинарном файле, используя отображение на память с помощью системного вызова mmap.

На стандартный поток вывода вывести список всех позиций (с нуля) в файле, где втречаются строка.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf06/inf06-0.c)

## Inf06-1
### Задача inf06-1: posix/mmap/print-list-using-mmap
Программе в аргументе командной строки передается имя файла с бинарными данными в Little-Endian.

Файл хранит внутри себя односвязный список элементов:

```
struct Item {
  int value;
  uint32_t next_pointer;
};
```

Поле value храние значение элемента списка, поле next_pointer - позицию в файле (в байтах), указывающую на следующий элемент. Признаком последнего элемента является значение next_pointer, равное 0.

Расположение первого элемента списка (если он существует) - строго в нулевой позиции в файле, расположение остальных - случайным образом.

Выведите на экран значения элементов в списке в текстовом представлении.

Используйте отображение содержимого файла на память.

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf06/inf06-1.c)

## Inf06-2
### Задача inf06-2: posix/mmap/make-spiral-file
Программе передаются три аргумента: имя файла, положительное целое число N - размер квадратной матрицы, и положительное число W - ширина клетки матицы в символах.

Необходимо в указанном файле сформировать текст, который содержит матрицу, состоящую из чисел от 1 до N2, таким образом, чтобы числа заполняли её по спирали, по часовой стрелке.

Числа должны быть выровнены по правой границе ячейки матрицы.

Используйте mmap для записи в файл.

Можно использовать функции форматного вывода для преобразования числа в строку.

### Примеры
__Входные данные__
```
./solution out.txt 5 5
```
__Результат работы в файле out.txt__
```
    1    2    3    4    5
   16   17   18   19    6
   15   24   25   20    7
   14   23   22   21    8
   13   12   11   10    9
```

__Язык:	gcc - Plain C, 64 bit, using -std=c11 or -std=gnu11__

[solution](inf06/inf06-2.c)
