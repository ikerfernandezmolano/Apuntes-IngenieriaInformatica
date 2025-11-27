package org.is.practica2;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.GridLayout;
import javax.swing.JRadioButton;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import javax.swing.ButtonGroup;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;

public class GUI extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JRadioButton rdbtnNewRadioButton;
	private JRadioButton rdbtnNewRadioButton_1;
	private JButton btnNewButton;
	private final ButtonGroup buttonGroup = new ButtonGroup();
	private int longitud;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI frame = new GUI();
					frame.setVisible(true);
					frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public GUI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new GridLayout(3, 1, 0, 0));
		contentPane.add(getRdbtnNewRadioButton());
		contentPane.add(getRdbtnNewRadioButton_1());
		contentPane.add(getBtnNewButton());
	}

	private JRadioButton getRdbtnNewRadioButton() {
		if (rdbtnNewRadioButton == null) {
			rdbtnNewRadioButton = new JRadioButton("5x5");
			rdbtnNewRadioButton.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					longitud=5;
				}
			});
			rdbtnNewRadioButton.setBackground(new Color(255, 255, 255));
			rdbtnNewRadioButton.setForeground(new Color(0, 0, 0));
			buttonGroup.add(rdbtnNewRadioButton);
			rdbtnNewRadioButton.setHorizontalAlignment(SwingConstants.CENTER);	
		}
		return rdbtnNewRadioButton;
	}
	private JRadioButton getRdbtnNewRadioButton_1() {
		if (rdbtnNewRadioButton_1 == null) {
			rdbtnNewRadioButton_1 = new JRadioButton("10x10");
			rdbtnNewRadioButton_1.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					longitud=10;
				}
				@Override
				public void mouseEntered(MouseEvent e) {
				}
			});
			rdbtnNewRadioButton_1.setBackground(new Color(255, 255, 255));
			rdbtnNewRadioButton_1.setForeground(new Color(0, 0, 0));
			buttonGroup.add(rdbtnNewRadioButton_1);
			rdbtnNewRadioButton_1.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return rdbtnNewRadioButton_1;
	}
	private JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("Go!");
			btnNewButton.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					if(rdbtnNewRadioButton.isSelected()||rdbtnNewRadioButton_1.isSelected()) {
						GUI2 frame2 = new GUI2(longitud);
						frame2.setVisible(true);
						frame2.setExtendedState(JFrame.MAXIMIZED_BOTH);
						setVisible(false);
					}
				}
			});
			btnNewButton.setBackground(new Color(255, 255, 255));
			btnNewButton.setForeground(new Color(0, 0, 0));
		}
		return btnNewButton;
	}
}
