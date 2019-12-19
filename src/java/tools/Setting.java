/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.awt.event.KeyEvent;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author DELL
 */
public class Setting {

    public void checkNumber(KeyEvent evt, JLabel lbl) {
        if ((Character.isAlphabetic(evt.getKeyChar()))) {
            evt.consume();
            lbl.setText("Masukkan Angka");
        } else {
            lbl.setText("");
        }
    }

    public void checkNumber2(KeyEvent evt) {
        if (Character.isAlphabetic(evt.getKeyChar())) {
            evt.consume();
            JOptionPane.showMessageDialog(null, "Masukkan Angka");
        }
    }

    public void checkAlphabet(java.awt.event.KeyEvent b) {
        if (Character.isDigit(b.getKeyChar())) {
            b.consume();
            JOptionPane.showMessageDialog(null, "Tidak Boleh Angka");
        }
    }

    public void checkLength(JTextField txt, int size, KeyEvent evt, JLabel lbl) {
        if (txt.getText().length() >= size) {
            evt.consume();
            lbl.setText("Tidak Boleh Lebih " + size + " Karakter");
        } else {
            lbl.setText("");
        }
    }
    public void checkLength(JTextField txt, int size, KeyEvent evt) {
        if (txt.getText().length() >= size) {
            evt.consume();
            JOptionPane.showMessageDialog(null,"Tidak Bisa Lebih "+size+" Karakter");
        } 
    }

    public void checkNull(JTextField txt, KeyEvent evt, JLabel lbl) {
        if (txt.getText() == "") {
            evt.consume();
            lbl.setText("Tidak Boleh Kosong");

        } else {
            lbl.setText("");
        }
    }

//    public void mnDropdwon(JComboBox cmb, controller) {
//
//        EmployeeController employeeController = new EmployeeController();
//        JobController jobController = new JobController();
//        DepartmentController departmentController = new DepartmentController();
//        
//        for (models.Employee e : employeeController.getAll()) {
//            cmb.addItem(e.getFirstname());
//
//        }
//
//    }
}
