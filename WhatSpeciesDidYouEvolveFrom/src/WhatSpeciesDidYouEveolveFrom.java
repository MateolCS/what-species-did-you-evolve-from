import javax.swing.*; 
import java.awt.*; 

public class WhatSpeciesDidYouEveolveFrom {
	private QuestionEngine engine;
	private JFrame frame;
	private JLabel mainLabel;
	private JPanel answersPanel;
	private Colors colors = new Colors();
	
	 public static void main(String[] args) {
	        SwingUtilities.invokeLater(() -> {
	            try {
	                new WhatSpeciesDidYouEveolveFrom().start();
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
	        frame.getContentPane().setBackground(colors.getBackground());
	        frame.setSize(900, 500);
	        frame.setLayout(new BorderLayout(10, 10));

	        mainLabel = new JLabel("", SwingConstants.CENTER);
	        mainLabel.setBackground(colors.getBackground());
	        mainLabel.setOpaque(true);
	        mainLabel.setFont(new Font("Arial", Font.BOLD,50));
	        mainLabel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

	        answersPanel = new JPanel(new GridLayout(0, 1, 8, 8));
	        answersPanel.setBackground(colors.getBackground());
	        answersPanel.setOpaque(true); 
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
	                mainLabel.setForeground(colors.getCommunicateColor());

	                for (String ans : q.getAnswers()) {
	                    JButton btn = new JButton(ans);
	                    btn.setBackground(colors.getButtonColor());
	                    btn.setForeground(colors.getButtonText());
	                    btn.setFont(new Font("Arial", Font.BOLD, 20));
	                    btn.addActionListener(e -> {
	                        try {
	                            engine.answer(ans, q.getText());
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