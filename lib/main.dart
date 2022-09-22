import "package:flutter/material.dart";
import 'resultado.dart';
import 'questionario.dart';

main(){
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'rosa', 'pontuacao': 10},
        {'texto': 'preto', 'pontuacao': 1},
        {'texto': 'roxo', 'pontuacao': 15},
        {'texto': 'verde', 'pontuacao': 12}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 1},
        {'texto': 'Cobra', 'pontuacao': 15},
        {'texto': 'Raposa', 'pontuacao': 12}
      ]
    },
    {
      'texto': 'Qual é o seu sorvete favorito?',
      'respostas': [
        {'texto': 'Morango', 'pontuacao': 10},
        {'texto': 'Flocos', 'pontuacao': 1},
        {'texto': 'Creme', 'pontuacao': 15},
        {'texto': 'Nutella', 'pontuacao': 12}
      ]
    }
  ];

  void _responder(int pontuacao){
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),

        //condicional
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            quandoResponder: _responder
        )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario)
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState(){
  return _PerguntaAppState();
  }
}
