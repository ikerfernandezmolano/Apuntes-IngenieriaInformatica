package org.is.practica1;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import javax.swing.JRadioButton;
import java.awt.FlowLayout;


public class Interfaz extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JLabel lblGame;
	private JPanel panel;
	private JPanel panel_1;
	private JPanel panel_2;
	private JPanel panel_3;
	private JPanel panel_4;
	private JRadioButton rdbtnNewRadioButton;
	private JRadioButton rdbtnNewRadioButton_1;
	private JRadioButton rdbtnR;
	private JRadioButton rdbtnR_1;
	private JButton btnNewButton;
	private JButton btnNewButton_1;
	private JButton btnNewButton_2;
	private JButton btnNewButton_3;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Interfaz frame = new Interfaz();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Interfaz() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1307, 947);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		contentPane.add(getLblGame(), BorderLayout.NORTH);
		contentPane.add(getPanel_1(), BorderLayout.CENTER);
		contentPane.add(getPanel_3(), BorderLayout.EAST);
		contentPane.add(getPanel_4(), BorderLayout.SOUTH);
	}
	private JLabel getLblGame() {
		if (lblGame == null) {
			lblGame = new JLabel("Game!");
			lblGame.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblGame;
	}
	private JPanel getPanel_1() {
		if (panel == null) {
			panel = new JPanel();
			panel.setLayout(new GridLayout(0, 2, 0, 0));
			panel.add(getPanel_1_1());
			panel.add(getPanel_2());
		}
		return panel;
	}
	private JPanel getPanel_1_1() {
		if (panel_1 == null) {
			panel_1 = new JPanel();
			panel_1.setLayout(new GridLayout(10, 10, 0, 0));
			for(int i=0;i<10;i++) {
				for(int j=0;j<10;j++) {
					panel_1.add(getButton("@",i,j));
				}
			}
		}
		return panel_1;
	}
	private JPanel getPanel_2() {
		if (panel_2 == null) {
			panel_2 = new JPanel();
			panel_2.setLayout(new GridLayout(10, 10, 0, 0));
			for(int i=0;i<10;i++) {
				for(int j=0;j<10;j++) {
					panel_2.add(getButton("#",i,j));
				}
			}
		}
		return panel_2;
	}
	private JPanel getPanel_3() {
		if (panel_3 == null) {
			panel_3 = new JPanel();
			panel_3.setLayout(new GridLayout(4, 1, 0, 0));
			panel_3.add(getRdbtnNewRadioButton());
			panel_3.add(getRdbtnNewRadioButton_1());
			panel_3.add(getRdbtnR());
			panel_3.add(getRdbtnR_1());
		}
		return panel_3;
	}
	private JPanel getPanel_4() {
		if (panel_4 == null) {
			panel_4 = new JPanel();
			panel_4.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
			panel_4.add(getBtnNewButton());
			panel_4.add(getBtnNewButton_1());
			panel_4.add(getBtnNewButton_2());
			panel_4.add(getBtnNewButton_3());
		}
		return panel_4;
	}
	private JRadioButton getRdbtnNewRadioButton() {
		if (rdbtnNewRadioButton == null) {
			rdbtnNewRadioButton = new JRadioButton("R1");
		}
		return rdbtnNewRadioButton;
	}
	private JRadioButton getRdbtnNewRadioButton_1() {
		if (rdbtnNewRadioButton_1 == null) {
			rdbtnNewRadioButton_1 = new JRadioButton("R2");
		}
		return rdbtnNewRadioButton_1;
	}
	private JRadioButton getRdbtnR() {
		if (rdbtnR == null) {
			rdbtnR = new JRadioButton("R3");
		}
		return rdbtnR;
	}
	private JRadioButton getRdbtnR_1() {
		if (rdbtnR_1 == null) {
			rdbtnR_1 = new JRadioButton("R4");
		}
		return rdbtnR_1;
	}
	private JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("B1");
			btnNewButton.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
				}
			});
		}
		return btnNewButton;
	}
	private JButton getBtnNewButton_1() {
		if (btnNewButton_1 == null) {
			btnNewButton_1 = new JButton("B2");
			btnNewButton_1.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
				}
			});
		}
		return btnNewButton_1;
	}
	private JButton getBtnNewButton_2() {
		if (btnNewButton_2 == null) {
			btnNewButton_2 = new JButton("B3");
		}
		return btnNewButton_2;
	}
	private JButton getBtnNewButton_3() {
		if (btnNewButton_3 == null) {
			btnNewButton_3 = new JButton("B4");
		}
		return btnNewButton_3;
	}
	private JButton getButton(String simbolo, int pFila, int pCol) {
	    JButton boton = new JButton();
	    boton.setText(simbolo + pFila + pCol);
	    boton.setHorizontalTextPosition(JButton.CENTER);  
	    boton.setVerticalTextPosition(JButton.CENTER);
	    return boton;
	}
}
