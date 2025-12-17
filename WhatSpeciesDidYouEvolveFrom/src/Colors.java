import java.awt.Color;

public class Colors {
	private Color backgroundColor;
	private Color buttonColor;
	private Color buttonText;
	private Color communicateColor;
	
	
	public Colors() {
		backgroundColor = new Color(41, 96, 115);
		buttonColor = new Color(53, 150, 181);
		buttonText = new Color(213, 202, 189);
		communicateColor = new Color(173, 197, 207);
	}
	
	
	public Color getBackground() {
		return backgroundColor;
	}
	
	
	public Color getButtonColor() {
		return buttonColor;
	}
	
	public Color getButtonText() {
		return buttonText;
	}
	
	public Color getCommunicateColor() {
		return communicateColor;
	}

}
