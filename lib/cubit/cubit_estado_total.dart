// ignore_for_file: file_names, must_be_immutable, depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

class ListaSpiner extends Equatable {
  List<TextEditingController> etiqueta;
  ListaSpiner({required this.etiqueta});
  @override
  List<Object?> get props => [etiqueta];
  ListaSpiner copyWith({List<TextEditingController>? etiqueta}) {
    return ListaSpiner(etiqueta: etiqueta ?? this.etiqueta);
  }
}

class ListaSpinerCubit extends Cubit<ListaSpiner> {
  ListaSpinerCubit() : super(ListaSpiner(etiqueta: const []));

  Future<void> agregar() async {
    final NuevaEtiqueta = TextEditingController();
    final nuevasEtiquetas = List<TextEditingController>.from(state.etiqueta)
      ..add(NuevaEtiqueta);
    final nuevaLista = state.copyWith(etiqueta: nuevasEtiquetas);
    emit(nuevaLista);
  }

  Future<void> editar(int index, TextEditingController nuevaEtiqueta) async {
    final nuevasEtiquetas = List<TextEditingController>.from(state.etiqueta)
      ..[index] = nuevaEtiqueta;
    final nuevaLista = state.copyWith(etiqueta: nuevasEtiquetas);
    emit(nuevaLista);
  }

  Future<void> eliminar(int index) async {
    final nuevasEtiquetas = List<TextEditingController>.from(state.etiqueta)
      ..removeAt(index);
    final nuevaLista = state.copyWith(etiqueta: nuevasEtiquetas);
    emit(nuevaLista);
  }

  Future<void> eliminarTodo() async {
    final nuevaLista = state.copyWith(etiqueta: []);
    emit(nuevaLista);
  }

  List<TextEditingController> obtenerTodo() {
    return List<TextEditingController>.from(state.etiqueta);
  }
}
