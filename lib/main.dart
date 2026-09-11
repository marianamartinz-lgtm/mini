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

// ======================================================
// TELA 1 - CADASTRO
// ======================================================

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

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaResumo(
          nome: nome,
          cidade: cidade,
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

// ======================================================
// TELA 2 - RESUMO
// ======================================================

class TelaResumo extends StatelessWidget {

  final String nome;
  final String cidade;

  const TelaResumo({
    super.key,
    required this.nome,
    required this.cidade,
  });

  void confirmarCadastro(BuildContext context) {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => TelaConfirmacao(
          nome: nome,
          cidade: cidade,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Resumo do Cadastro',
        ),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.stretch,

          children: [

            const SizedBox(height: 30),

            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              'Confira seus dados',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            Card(

              elevation: 4,

              child: Padding(

                padding: const EdgeInsets.all(20),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Nome:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Cidade:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      cidade,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              height: 55,

              child: ElevatedButton.icon(

                onPressed: () {
                  confirmarCadastro(context);
                },

                icon: const Icon(
                  Icons.check,
                ),

                label: const Text(
                  'Confirmar cadastro',

                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 50,

              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  'Voltar e editar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// TELA 3 - CONFIRMAÇÃO
// ======================================================

class TelaConfirmacao extends StatelessWidget {

  final String nome;
  final String cidade;

  const TelaConfirmacao({
    super.key,
    required this.nome,
    required this.cidade,
  });

  void irParaInicio(BuildContext context) {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => TelaInicio(
          nome: nome,
          cidade: cidade,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Confirmação',
        ),
        centerTitle: true,
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 120,
              ),

              const SizedBox(height: 25),

              const Text(
                'Cadastro confirmado!',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Parabéns, $nome!',

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Cidade: $cidade',

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  onPressed: () {
                    irParaInicio(context);
                  },

                  icon: const Icon(
                    Icons.home,
                  ),

                  label: const Text(
                    'Ir para o início',

                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// TELA 4 - INÍCIO
// ======================================================

class TelaInicio extends StatelessWidget {

  final String nome;
  final String cidade;

  const TelaInicio({
    super.key,
    required this.nome,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Início',
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(24),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.stretch,

          children: [

            const SizedBox(height: 35),

            const Icon(
              Icons.home,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 25),

            Text(
              'Bem-vindo, $nome!',

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Seu cadastro foi concluído com sucesso.',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            Card(

              elevation: 4,

              child: Padding(

                padding: const EdgeInsets.all(20),

                child: Column(

                  children: [

                    const Text(
                      'Dados cadastrados',

                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ListTile(

                      leading: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),

                      title: const Text(
                        'Nome',
                      ),

                      subtitle: Text(
                        nome,
                      ),
                    ),

                    ListTile(

                      leading: const Icon(
                        Icons.location_city,
                        color: Colors.blue,
                      ),

                      title: const Text(
                        'Cidade',
                      ),

                      subtitle: Text(
                        cidade,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              height: 55,

              child: ElevatedButton.icon(

                onPressed: () {

                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          const TelaCadastro(),
                    ),

                    (route) => false,
                  );

                },

                icon: const Icon(
                  Icons.add,
                ),

                label: const Text(
                  'Fazer novo cadastro',

                  style: TextStyle(
                    fontSize: 17,
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