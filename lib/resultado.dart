import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario ;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8 ) {
      return "ih, meteu essa?";
    } else if (pontuacao < 12) {
      return "Parabuains!";
    }else if (pontuacao < 16){
      return "Não tem jeito, você é top";
    } else {
      return "Foda, esse cara é foda";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text(
                "Reiniciar?",
              style: TextStyle(fontSize: 28),
            ))
      ],
    );
  }
}
