// ignore_for_file: camel_case_types, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import '../cubit/CubitEtiquetas.dart';
import '../cubit/cubit_estado_total.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fd.dart';

class listspiner extends StatelessWidget {
  const listspiner({super.key});

  @override
  Widget build(BuildContext context) {
    final controladores = context.watch<ListaSpinerCubit>().state.etiqueta;
    bool allFieldsFilled = true;
    for (var controller in controladores) {
      if (controller.text.isEmpty) {
        allFieldsFilled = false;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("hola"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...controladores.map((e) => Row(
                        children: [
                          Flexible(
                              child: TextFormField(
                            controller: e,
                          )),
                          IconButton(
                              onPressed: () {
                                final i = controladores.indexOf(e);
                                context.read<ListaSpinerCubit>().eliminar(i);
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ))
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  context.read<ListaSpinerCubit>().agregar();
                },
                child: const Text("nuevo")),
            TextButton(
                onPressed: () {
                  for (var e in controladores) {
                    BlocProvider.of<CubitEtiquetas>(context)
                        .agregarEtiqueta(e.text);
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Formularior()));
                },
                child: const Text("guardar")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancelar")),
          ],
        ),
      ),
    );
  }
}
