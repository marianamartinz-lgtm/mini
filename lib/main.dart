import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Cadastro de Participantes',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController cidadeController =
      TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  void cadastrar() {

    String nome = nomeController.text;
    String cidade = cidadeController.text;

    if (nome.isEmpty || cidade.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos!',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cadastro realizado com sucesso!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Cadastro de Participantes',
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,

          children: [

            const SizedBox(height: 30),

            const Icon(
              Icons.person_add,
              size: 90,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Cadastrar Participante',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Preencha os dados abaixo',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              controller: nomeController,

              decoration: const InputDecoration(
                labelText: 'Nome completo',
                hintText: 'Digite seu nome',

                prefixIcon: Icon(
                  Icons.person,
                ),

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cidadeController,

              decoration: const InputDecoration(
                labelText: 'Cidade',
                hintText: 'Digite sua cidade',

                prefixIcon: Icon(
                  Icons.location_city,
                ),

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              height: 55,

              child: ElevatedButton.icon(

                onPressed: cadastrar,

                icon: const Icon(
                  Icons.arrow_forward,
                ),

                label: const Text(
                  'Cadastrar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}