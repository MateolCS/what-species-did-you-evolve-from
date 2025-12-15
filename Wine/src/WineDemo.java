import javax.swing.*; 
import javax.swing.border.*; 
import javax.swing.table.*;
import java.awt.*; 
import java.awt.event.*; 
 
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.MissingResourceException;

import CLIPSJNI.*;

import CLIPSJNI.Environment;
import CLIPSJNI.PrimitiveValue;

import java.util.Scanner;


public class WineDemo {
	private QuestionEngine engine;
	private JFrame frame;
	private JLabel mainLabel;
	private JPanel answersPanel;
	
	 public static void main(String[] args) {
	        SwingUtilities.invokeLater(() -> {
	            try {
	                new WineDemo().start();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        });
	    }
	 
	 public void start() throws Exception {
	        engine = new QuestionEngine();
	        buildUI();
	        refresh();
	    }
	 
	 private void buildUI() {
	        frame = new JFrame("Wine Demo Expert System");
	        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	        frame.setSize(500, 300);
	        frame.setLayout(new BorderLayout(10, 10));

	        mainLabel = new JLabel("", SwingConstants.CENTER);
	        mainLabel.setFont(new Font("Arial", Font.BOLD, 18));
	        mainLabel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

	        answersPanel = new JPanel(new GridLayout(0, 1, 8, 8));
	        answersPanel.setBorder(BorderFactory.createEmptyBorder(10, 40, 20, 40));

	        frame.add(mainLabel, BorderLayout.NORTH);
	        frame.add(answersPanel, BorderLayout.CENTER);

	        frame.setVisible(true);
	    }
	 
	 private void refresh() {
	        answersPanel.removeAll();

	        try {
	            if (engine.hasResult()) {
	                mainLabel.setText(engine.getResultText());
	            } else {
	                Question q = engine.getCurrentQuestion();
	                if (q == null) {
	                    mainLabel.setText("Brak pytania.");
	                    return;
	                }

	                mainLabel.setText(
	                    "<html><div style='text-align:center'>" +
	                    q.getText() +
	                    "</div></html>"
	                );

	                for (String ans : q.getAnswers()) {
	                    JButton btn = new JButton(ans);
	                    btn.addActionListener(e -> {
	                        try {
	                            engine.answer(ans);
	                            refresh();
	                        } catch (Exception ex) {
	                            ex.printStackTrace();
	                        }
	                    });
	                    answersPanel.add(btn);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        frame.revalidate();
	        frame.repaint();
	    }
	 
}