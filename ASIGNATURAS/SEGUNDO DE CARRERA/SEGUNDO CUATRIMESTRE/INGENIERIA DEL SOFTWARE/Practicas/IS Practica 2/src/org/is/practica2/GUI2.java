package org.is.practica2;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.GridLayout;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.FlowLayout;
import javax.swing.SwingConstants;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.awt.event.ActionEvent;

public class GUI2 extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JPanel panel;
	private JPanel panel_1;
	private JLabel lblNewLabel;
	private JButton btnNewButton;
	private JButton btnNewButton_1;
	private JButton btnNewButton_2;
	private ArrayList<JLabel> listaJLabels;
	private int posLabelActual;
	private int longitud;

	public GUI2(int pLong) {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 775, 504);
		longitud=pLong;
		posLabelActual=-1;
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		listaJLabels=new ArrayList<JLabel>();
		contentPane.add(getPanel(), BorderLayout.CENTER);
		contentPane.add(getPanel_1(), BorderLayout.EAST);
	}

	private JPanel getPanel() {
		if (panel == null) {
			panel = new JPanel();
			panel.setLayout(new GridLayout(longitud, longitud, 0, 0));
			for(int i=0;i<longitud;i++) {
				for(int j=0;j<longitud;j++) {
					panel.add(getLblNewLabel(j+1,i+1));
				}
			}
		}
		return panel;
	}
	private JPanel getPanel_1() {
		if (panel_1 == null) {
			panel_1 = new JPanel();
			panel_1.setLayout(new GridLayout(4, 1, 0, 0));
			panel_1.add(getLblNewLabel_1());
			panel_1.add(getBtnNewButton());
			panel_1.add(getBtnNewButton_1());
			panel_1.add(getBtnNewButton_2());
		}
		return panel_1;
	}
	private JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("Horizontal");
			btnNewButton.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					if(posLabelActual!=-1) {
						highlightHorizontal(posLabelActual/longitud);
					}
				}
			});
			btnNewButton.setBackground(new Color(255, 255, 255));
		}
		return btnNewButton;
	}
	private JButton getBtnNewButton_1() {
		if (btnNewButton_1 == null) {
			btnNewButton_1 = new JButton("Vertical");
			btnNewButton_1.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					if(posLabelActual!=-1) highlightVertical(posLabelActual%longitud);
				}
			});
			btnNewButton_1.setBackground(new Color(255, 255, 255));
		}
		return btnNewButton_1;
	}
	private JButton getBtnNewButton_2() {
		if (btnNewButton_2 == null) {
			btnNewButton_2 = new JButton("Surrond");
			btnNewButton_2.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					if(posLabelActual!=-1) highlightSurrond(posLabelActual%longitud,posLabelActual/longitud);
				}
			});
			btnNewButton_2.setBackground(new Color(255, 255, 255));
		}
		return btnNewButton_2;
	}
	private JLabel getLblNewLabel_1() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("X:?? & Y:??");
			lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblNewLabel;
	}
	private JLabel getLblNewLabel(int pX,int pY) {
		JLabel lblLabel=new JLabel();
		lblLabel.setOpaque(true);
		lblLabel.setBackground(Color.black);
		lblLabel.setBorder(BorderFactory.createLineBorder(Color.white));
		listaJLabels.add(lblLabel);
		lblLabel.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if(posLabelActual!=-1)restartMatrix(posLabelActual);
				lblLabel.setBackground(Color.red);
				posLabelActual=listaJLabels.indexOf(lblLabel);
				lblNewLabel.setText("X:"+(posLabelActual%longitud+1)+" & Y:"+(posLabelActual/longitud+1));
			}
		});
		return lblLabel;
	}
	private void highlightHorizontal(int pFila) {
		for(int i=0;i<longitud;i++) {
			listaJLabels.get(pFila*longitud+i).setBackground(Color.red);
		}
	}
	private void highlightVertical(int pColumna) {
		for(int i=0;i<longitud;i++) {
			listaJLabels.get(pColumna+longitud*i).setBackground(Color.red);
		}
	}
	private void highlightSurrond(int pColumna,int pFila) {
		int col, fila;
		for(int i=-1;i<2;i=i+2) {
			col=pColumna+i;
			fila=pFila+i;
			if(fila>=0&&fila<longitud) {
				listaJLabels.get(pColumna+fila*longitud).setBackground(Color.red);
			}
			if(col>=0&&col<longitud) {
				listaJLabels.get(col+pFila*longitud).setBackground(Color.red);
			}
		}
	}
	private void restartMatrix(int pCoords) {
		listaJLabels.get(pCoords).setBackground(Color.black);
		for(int i=0;i<longitud;i++) {
			listaJLabels.get(pCoords/longitud*longitud+i).setBackground(Color.black);
			listaJLabels.get(pCoords%longitud+longitud*i).setBackground(Color.black);
		}
	}
}
