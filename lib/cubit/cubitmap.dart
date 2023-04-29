import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
