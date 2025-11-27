package viewController;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import model.GestorSemaforos;


public class SemaforoCoches extends JFrame implements Observer  {

	private static final long serialVersionUID = -1526416068663302084L;
	private JPanel contentPane;
	private JPanel pnlSemaforo;
	private LuzSemaforo luzVerde = null;
	private LuzSemaforo luzRoja = null;
	private JLabel lblCont;

	/**
	 * Create the frame.
	 */
	public SemaforoCoches() {
		GestorSemaforos.getGestorSemaforos().addObserver(this);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		initialize();
	}

	/**
	 * Inicializa los componentes de la ventana
	 */
	private void initialize() {
		setSize(150, 555);
		this.setContentPane(getContentPane());
		setTitle("Coches");
		setLocationRelativeTo(null);
		setVisible(true);
	}
	
	/**
	 * Devuelve el panel principal. Si no se ha construido aun, crea una nueva instancia
	 * @return el panel principal
	 */
	public JPanel getContentPane() {
		if (contentPane == null) {
			contentPane = new JPanel();
			contentPane.setLayout(new BorderLayout());
			contentPane.add(getPnlSemaforo(), BorderLayout.CENTER);
		}
		return contentPane;
	}

	/**
	 * Devuelve el panel del semaforo. Si no se ha construido aun, se crea una nueva instancia
	 * @return el panel del semaforo
	 */
	private JPanel getPnlSemaforo() {
		if (pnlSemaforo == null) {
			pnlSemaforo = new JPanel();
			pnlSemaforo.setLayout(new GridLayout(4, 1, 0, 10));
			pnlSemaforo.add(getLblCont());
			pnlSemaforo.add(getLuzRoja(),null);
			pnlSemaforo.add(getLuzVerde(),null);
		}
		return pnlSemaforo;
	}
	
	/**
	 * Devuelve el panel para la luz roja. Si no se ha construido aun, se crea una nueva instancia
	 * @return el panel que representa la luz roja
	 */
	private LuzSemaforo getLuzRoja() {
		if (luzRoja == null) {
			luzRoja = new LuzSemaforo("rojo", true);
		}
		return luzRoja;
	}

	/**
	 * Devuelve el panel para la luz verde. Si no se ha construido aun, se crea una nueva instancia
	 * @return el panel que representa la luz verde
	 */
	private LuzSemaforo getLuzVerde() {
		if (luzVerde == null) {
			luzVerde = new LuzSemaforo("verde", false);
		}
		return luzVerde;
	}
	

	private JLabel getLblCont() {
		if (lblCont == null) {
			lblCont = new JLabel("15");
			lblCont.setOpaque(true);
			lblCont.setBackground(Color.BLACK);
			lblCont.setFont(new Font("Lucida Grande", Font.BOLD, 72));
			lblCont.setHorizontalAlignment(SwingConstants.CENTER);
			lblCont.setForeground(Color.RED);
		}
		return lblCont;
	}

	@Override
	public void update(Observable o, Object arg) {
		if(o instanceof GestorSemaforos) {
			Object[] res= (Object[])arg;
			lblCont.setText(Integer.toString((int)res[0]));
			boolean verde=(boolean)res[1];
			if(verde) lblCont.setForeground(Color.GREEN);
			else lblCont.setForeground(Color.RED);
			luzVerde.setActivo(verde);
			luzRoja.setActivo(!verde);
		}
	}
}
