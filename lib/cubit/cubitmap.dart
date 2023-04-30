import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
class TareasCubit extends Cubit<TareasState> {
  TareasCubit() : super(TareasState());

  void agregarTarea(String titulo, dynamic descripcion) {
    final Map<String, dynamic> newtarea = Map.from(state.tareas)
      ..[titulo] = descripcion;
    emit(state.copyWith(tareas: newtarea));
  }

  void editarTarea(String titulo, dynamic nuevaDescripcion) {
    final Map<String, dynamic> editt = Map.from(state.tareas)..remove(titulo);
    emit(TareasState(tareas: editt));
  }

/*
  void editarTarea(
      String titulo, String nuevoTitulo, dynamic nuevaDescripcion) {
    final Map<String, dynamic> eliminartarea = Map.from(state.tareas)
      ..remove(titulo);
    final Map<String, dynamic> newtareaedit = Map.from(state.tareas)
      ..[titulo] = nuevaDescripcion;
    emit(state.copyWith(tareas: newtareaedit));
    emit(state.copyWith(tareas: eliminartarea));
  }
*/
  /*
  void editarTarea(String id, String nuevaDescripcion, dynamic nuevoValor) {
    final nuevasTareas = Map<String, dynamic>.from(state.tareas);
    final tarea = nuevasTareas[id];
    if (tarea != null) {
      nuevasTareas[id] = tarea.copyWith(nuevaDescripcion, nuevoValor);
      emit(TareasState(tareas: nuevasTareas));
    }
  }

*/
  void eliminarTarea(String titulo) {
    final Map<String, dynamic> eliminartarea2 = Map.from(state.tareas)
      ..remove(titulo);
    emit(state.copyWith(tareas: eliminartarea2));
  }
}

class TareasState extends Equatable {
  final Map<String, dynamic> tareas;

  TareasState({Map<String, dynamic>? tareas}) : tareas = tareas ?? {};

  @override
  List<Object?> get props => [tareas];

  TareasState copyWith({Map<String, dynamic>? tareas}) {
    return TareasState(tareas: tareas ?? this.tareas);
  }
}
*/
enum TareasStatus { init, loading, success, failure }

class TareasCubit extends Cubit<TareasState> {
  TareasCubit() : super(TareasState());

  void agregarTarea(String titulo, dynamic descripcion) async {
    emit(state.copyWith(status: TareasStatus.loading));
    try {
      final Map<String, dynamic> newtarea = Map.from(state.tareas)
        ..[titulo] = descripcion;
      emit(state.copyWith(tareas: newtarea, status: TareasStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TareasStatus.failure));
    }
  }

  void editarTarea(String titulo, dynamic nuevaDescripcion) async {
    emit(state.copyWith(status: TareasStatus.loading));
    try {
      final Map<String, dynamic> editt = Map.from(state.tareas)..remove(titulo);
      emit(TareasState(tareas: editt, status: TareasStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TareasStatus.failure));
    }
  }

  void eliminarTarea(String titulo) async {
    emit(state.copyWith(status: TareasStatus.loading));
    try {
      final Map<String, dynamic> eliminartarea2 = Map.from(state.tareas)
        ..remove(titulo);
      emit(
          state.copyWith(tareas: eliminartarea2, status: TareasStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TareasStatus.failure));
    }
  }
}

class TareasState extends Equatable {
  final Map<String, dynamic> tareas;
  final TareasStatus status;

  TareasState({Map<String, dynamic>? tareas, TareasStatus? status})
      : tareas = tareas ?? {},
        status = status ?? TareasStatus.init;

  @override
  List<Object?> get props => [tareas, status];

  TareasState copyWith({Map<String, dynamic>? tareas, TareasStatus? status}) {
    return TareasState(
      tareas: tareas ?? this.tareas,
      status: status ?? this.status,
    );
  }
}
