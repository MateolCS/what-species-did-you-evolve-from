import CLIPSJNI.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionEngine {

    private final Environment clips;

    public QuestionEngine() throws Exception {
        clips = new Environment();
        clips.load("species.clp");
        clips.reset();
        clips.run();
    }

    public boolean hasResult() throws Exception {
        PrimitiveValue wynik =
                clips.eval("(find-all-facts ((?w wynik)) TRUE)");
        return wynik.size() > 0;
    }

    public String getResultText() throws Exception {
        PrimitiveValue wynik =
                clips.eval("(find-all-facts ((?w wynik)) TRUE)");
        
        if(wynik.size() == 0) {
        	return null;
        }

        PrimitiveValue w = wynik.get(0);
        String zwierze = w.getFactSlot("zwierze").stringValue();
        String klucz = w.getFactSlot("klucz").stringValue();

        return "<html><div style='text-align:center'>" +
               "<b>WYNIK</b><br><br>" +
               "Zwierzę: <b>" + zwierze + "</b><br>" +
               "Klucz: <b>" + klucz + "</b>" +
               "</div></html>";
    }

    public Question getCurrentQuestion() throws Exception {
        PrimitiveValue pytania =
                clips.eval("(find-all-facts ((?p pytanie)) TRUE)");

        PrimitiveValue p = pytania.get(0);
        String text = p.getFactSlot("tresc").stringValue();
        PrimitiveValue odp = p.getFactSlot("odpowiedzi");

        List<String> answers = new ArrayList<>();
        for (int i = 0; i < odp.size(); i++) {
            answers.add(odp.get(i).stringValue());
        }

        return new Question(text, answers);
    }

    public void answer(String answerText, String questionText) throws Exception {
        String fact =
                "(odpowiedz " + 
                "(tresc_pytania \"" + questionText + "\")"+
                "(tresc_odpowiedzi \"" + answerText + "\"))";
        clips.assertString(fact);
        clips.run();
    }
}
