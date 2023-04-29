// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CubitEtiquetas extends Cubit<EstadoCubitEtiquetas> {
  CubitEtiquetas() : super(const EstadoCubitEtiquetas([]));

  void agregarEtiqueta(String etiqueta) {
    final nuevaLista = List<String>.from(state.etiquetas)..add(etiqueta);
    emit(EstadoCubitEtiquetas(nuevaLista));
  }

  void editarEtiqueta(int index, String nuevaEtiqueta) {
    final nuevaLista = List<String>.from(state.etiquetas)
      ..[index] = nuevaEtiqueta;
    emit(EstadoCubitEtiquetas(nuevaLista));
  }

  void eliminarEtiqueta(int index) {
    final nuevaLista = List<String>.from(state.etiquetas)..removeAt(index);
    emit(EstadoCubitEtiquetas(nuevaLista));
  }

  void eliminarTodo() {
    emit(const EstadoCubitEtiquetas([]));
  }

  List<String> obtenerLista() {
    return List.from(state.etiquetas);
  }
}

class EstadoCubitEtiquetas extends Equatable {
  final List<String> etiquetas;

  const EstadoCubitEtiquetas(this.etiquetas);

  @override
  List<Object> get props => [etiquetas];
}
