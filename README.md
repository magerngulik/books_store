# Catatan belajar bloc dengan getit dan injectable

Untuk belajar ini ada beberapa depedensi yang harus di gunakan
**dependencies**
- bloc
- flutter bloc 
- get_it 
- freezed_annotation
- injectable

**dev dependencies**
- flutter_lints
- injectable_generator
- build_runner
- freezed

### Langkah langkah pembuatan
- buat dulu sebuah file di bagian root lib dengan nama injection.dart(posisi file sebenarnya bebas)

- buka di pub.dev di dokumentasi [injecttable](https://pub.dev/packages/injectable), scrool sedikit ke bawah pada bagian setup 
```dart

	
final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
void configureDependencies() => getIt.init();

```
- setelah itu import dulu package yang belum tersedia seperti injecttable dan get it
- jalakan perintah di terminal, bisa gunakan **build** atau **watch**
```dart
flutter pub run build_runner build
```
- langkah selanjut nya anda bisa setting pada bagian main project seperti ini
```dart
void main() {
  Bloc.observer = SimpleBLocOBserver();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

``` 
- selanjutnya akan membuat bloc dengan klik kanan **bloc:new cubit** 

- selanjutnya akan melakukan generate class freezed nya, tapi sebelum itu buat dulu class single nya
```dart 
part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _Initial;
  const factory CounterState.success({@Default(0) int data}) = _Success;
  const factory CounterState.failed() = _Failed;
  const factory CounterState.loading() = _Loading;
}
```

- selanjutnya jalankan **flutter pub run build_runner build**
- kemudian pada bagian conter cubit nya bisa sesuaikan sebagai berikut:
``` dart
@injectable
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState.initial());

  void changeData() async {
    emit(const CounterState.loading());
    await Future.delayed(const Duration(seconds: 4));
    var newData = Random().nextInt(2000);
    emit(CounterState.success(data: newData));
  }
}

```
- bagian terpenting dari kode di atas adalah bagian **@injectable**, kemudian jalan kan lagi **flutter pub run build_runner build** supaye class nya berfungsi

- setelah itu kita bisa buat bloc provider pada bagian root, karna jika method yang di gunakan *(@injectable)* maka tidak boleh tertutup jadi letakan saja pada bagian root. seperti berikut ini:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterTesting(),
      ),
    );
  }
}

```
- dari koding di atas anda bisa fokus pada bagian **getIt<CounterCubit>()** pada bagian ini yang membedakan dengan class biasa

- persiapkan bagian view kalian, untuk bagian view yang saya gunakan sabagai berikut:
```dart
import 'package:flutter/material.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/testing/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterTesting extends StatelessWidget {
  const CounterTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        <!-- print(state); -->
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Main Screen",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const Text(
                        "",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      );
                    },
                    loading: (value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    success: (value) {
                      return Text(
                        value.data.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.read<CounterCubit>().changeData();
                },
                child: const Text("Change Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
- dari koding di atas dapat dilihat dengan menggunakan getit maka untuk membentuk sebuah bloc builder yang memiliki satu bloc yang sama tidak perlu membuat sebuah variable seperti ini 
*var data = context.read<"CounterCubit">();*, cukup panggil saja class yang ingin di gunakan

- selanjutnya untuk bagian freezed dapat di lihat kita hanya perlu melakukan return pada class freezed dan semua sudah di handle
