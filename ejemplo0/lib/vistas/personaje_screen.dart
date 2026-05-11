import 'package:ejemplo0/vistas/view_models/auth_viewmodel.dart';
import 'package:ejemplo0/vistas/view_models/personajes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonajeScreen extends StatelessWidget {
  const PersonajeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final personajesVM = Provider.of<PersonajesViewModel>(context);
    final authVM = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM Firebase"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authVM.cerrarSesion(); // Acción al presionar el botón
            },
          ),
        ],
      ),
      body: personajesVM.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: personajesVM.listaPersonajes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(personajesVM.listaPersonajes[index].nombre),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => personajesVM.agregar(),
      ),
    );
  }
}
