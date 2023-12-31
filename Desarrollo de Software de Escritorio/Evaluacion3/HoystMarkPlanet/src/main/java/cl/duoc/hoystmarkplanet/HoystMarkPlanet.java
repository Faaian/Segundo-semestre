package cl.duoc.hoystmarkplanet;

import cl.duoc.hoystmarkplanet.Views.img.pAñadir;
import cl.duoc.hoystmarkplanet.Views.img.pEliminar;
import cl.duoc.hoystmarkplanet.Views.img.pModificar;
import cl.duoc.hoystmarkplanet.Views.img.pPrincipal;
import java.awt.BorderLayout;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import javax.swing.JPanel;

public class HoystMarkPlanet extends javax.swing.JFrame {

    public HoystMarkPlanet() {
        initComponents();
        setDia();
        initContent();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        background = new javax.swing.JPanel();
        lTitulo = new javax.swing.JLabel();
        menu = new javax.swing.JPanel();
        lMenu = new javax.swing.JLabel();
        lSeparador = new javax.swing.JLabel();
        bPrincipal = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        bEliminar = new javax.swing.JPanel();
        lEliminar = new javax.swing.JLabel();
        bAgregar = new javax.swing.JPanel();
        lAgregar = new javax.swing.JLabel();
        bModificar = new javax.swing.JPanel();
        lModificar = new javax.swing.JLabel();
        header = new javax.swing.JPanel();
        lFecha = new javax.swing.JLabel();
        pInterfaz = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        background.setBackground(new java.awt.Color(255, 255, 255));

        lTitulo.setFont(new java.awt.Font("Stencil", 0, 36)); // NOI18N
        lTitulo.setForeground(new java.awt.Color(51, 51, 51));
        lTitulo.setText("Hoyts Mark Planet");

        menu.setBackground(new java.awt.Color(56, 14, 97));
        menu.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menu.setPreferredSize(new java.awt.Dimension(270, 640));

        lMenu.setFont(new java.awt.Font("Tahoma", 0, 34)); // NOI18N
        lMenu.setForeground(new java.awt.Color(204, 204, 204));
        lMenu.setText("MENU");

        lSeparador.setForeground(new java.awt.Color(204, 204, 204));
        lSeparador.setText("___________________________________________");

        bPrincipal.setBackground(new java.awt.Color(56, 14, 97));
        bPrincipal.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bPrincipalMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                bPrincipalMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                bPrincipalMouseExited(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(204, 204, 204));
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iPrincipal.png"))); // NOI18N
        jLabel1.setText("Principal");
        jLabel1.setIconTextGap(15);

        javax.swing.GroupLayout bPrincipalLayout = new javax.swing.GroupLayout(bPrincipal);
        bPrincipal.setLayout(bPrincipalLayout);
        bPrincipalLayout.setHorizontalGroup(
            bPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bPrincipalLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        bPrincipalLayout.setVerticalGroup(
            bPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bPrincipalLayout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(jLabel1)
                .addContainerGap(27, Short.MAX_VALUE))
        );

        bEliminar.setBackground(new java.awt.Color(56, 14, 97));
        bEliminar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bEliminarMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                bEliminarMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                bEliminarMouseExited(evt);
            }
        });

        lEliminar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lEliminar.setForeground(new java.awt.Color(204, 204, 204));
        lEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iEliminar.png"))); // NOI18N
        lEliminar.setText("Eliminar");
        lEliminar.setIconTextGap(15);

        javax.swing.GroupLayout bEliminarLayout = new javax.swing.GroupLayout(bEliminar);
        bEliminar.setLayout(bEliminarLayout);
        bEliminarLayout.setHorizontalGroup(
            bEliminarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bEliminarLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(lEliminar)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        bEliminarLayout.setVerticalGroup(
            bEliminarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bEliminarLayout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(lEliminar)
                .addContainerGap(27, Short.MAX_VALUE))
        );

        bAgregar.setBackground(new java.awt.Color(56, 14, 97));
        bAgregar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bAgregarMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                bAgregarMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                bAgregarMouseExited(evt);
            }
        });

        lAgregar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lAgregar.setForeground(new java.awt.Color(204, 204, 204));
        lAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iAñadir.png"))); // NOI18N
        lAgregar.setText("Agregar");
        lAgregar.setIconTextGap(15);

        javax.swing.GroupLayout bAgregarLayout = new javax.swing.GroupLayout(bAgregar);
        bAgregar.setLayout(bAgregarLayout);
        bAgregarLayout.setHorizontalGroup(
            bAgregarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bAgregarLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(lAgregar)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        bAgregarLayout.setVerticalGroup(
            bAgregarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, bAgregarLayout.createSequentialGroup()
                .addContainerGap(27, Short.MAX_VALUE)
                .addComponent(lAgregar)
                .addGap(27, 27, 27))
        );

        bModificar.setBackground(new java.awt.Color(56, 14, 97));
        bModificar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bModificarMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                bModificarMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                bModificarMouseExited(evt);
            }
        });

        lModificar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lModificar.setForeground(new java.awt.Color(204, 204, 204));
        lModificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iModificar.png"))); // NOI18N
        lModificar.setText("Modificar");
        lModificar.setIconTextGap(15);

        javax.swing.GroupLayout bModificarLayout = new javax.swing.GroupLayout(bModificar);
        bModificar.setLayout(bModificarLayout);
        bModificarLayout.setHorizontalGroup(
            bModificarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bModificarLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(lModificar)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        bModificarLayout.setVerticalGroup(
            bModificarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bModificarLayout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(lModificar)
                .addContainerGap(27, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout menuLayout = new javax.swing.GroupLayout(menu);
        menu.setLayout(menuLayout);
        menuLayout.setHorizontalGroup(
            menuLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bPrincipal, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(menuLayout.createSequentialGroup()
                .addGroup(menuLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(menuLayout.createSequentialGroup()
                        .addGap(92, 92, 92)
                        .addComponent(lMenu))
                    .addGroup(menuLayout.createSequentialGroup()
                        .addGap(29, 29, 29)
                        .addComponent(lSeparador, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(29, Short.MAX_VALUE))
            .addComponent(bAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(bEliminar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(bModificar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        menuLayout.setVerticalGroup(
            menuLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(menuLayout.createSequentialGroup()
                .addGap(59, 59, 59)
                .addComponent(lMenu)
                .addGap(28, 28, 28)
                .addComponent(lSeparador)
                .addGap(35, 35, 35)
                .addComponent(bPrincipal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(bAgregar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(bModificar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(bEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        header.setBackground(new java.awt.Color(84, 20, 145));
        header.setPreferredSize(new java.awt.Dimension(750, 150));

        lFecha.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        lFecha.setForeground(new java.awt.Color(204, 204, 204));
        lFecha.setText("{day} {dd} de {month} del {year}");

        javax.swing.GroupLayout headerLayout = new javax.swing.GroupLayout(header);
        header.setLayout(headerLayout);
        headerLayout.setHorizontalGroup(
            headerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, headerLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lFecha)
                .addGap(100, 100, 100))
        );
        headerLayout.setVerticalGroup(
            headerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(headerLayout.createSequentialGroup()
                .addGap(48, 48, 48)
                .addComponent(lFecha)
                .addContainerGap(58, Short.MAX_VALUE))
        );

        pInterfaz.setBackground(new java.awt.Color(255, 255, 255));
        pInterfaz.setMaximumSize(new java.awt.Dimension(0, 0));
        pInterfaz.setPreferredSize(new java.awt.Dimension(780, 403));

        javax.swing.GroupLayout pInterfazLayout = new javax.swing.GroupLayout(pInterfaz);
        pInterfaz.setLayout(pInterfazLayout);
        pInterfazLayout.setHorizontalGroup(
            pInterfazLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 780, Short.MAX_VALUE)
        );
        pInterfazLayout.setVerticalGroup(
            pInterfazLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 403, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout backgroundLayout = new javax.swing.GroupLayout(background);
        background.setLayout(backgroundLayout);
        backgroundLayout.setHorizontalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(backgroundLayout.createSequentialGroup()
                .addComponent(menu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(header, javax.swing.GroupLayout.DEFAULT_SIZE, 798, Short.MAX_VALUE)
                    .addGroup(backgroundLayout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(backgroundLayout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(pInterfaz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(backgroundLayout.createSequentialGroup()
                                .addComponent(lTitulo)
                                .addGap(0, 0, Short.MAX_VALUE))))))
        );
        backgroundLayout.setVerticalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
            .addComponent(menu, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(backgroundLayout.createSequentialGroup()
                .addContainerGap(26, Short.MAX_VALUE)
                .addComponent(lTitulo)
                .addGap(18, 18, 18)
                .addComponent(header, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(pInterfaz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
            .addComponent(background, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void setDia() {
        LocalDate actual = LocalDate.now();
        Locale spanishLocale = new Locale("es", "ES");
        lFecha.setText(actual.format(DateTimeFormatter.ofPattern("EEEE dd 'de' MMMM 'del' yyyy", spanishLocale)));
    }

    private void initContent() {
        pPrincipal principal = new pPrincipal();
        pAñadir añadir = new pAñadir();
        mostrarPanel(principal);
    }

    private void mostrarPanel(JPanel p) {
        p.setSize(750, 400);
        p.setLocation(0, 0);

        pInterfaz.removeAll();
        pInterfaz.add(p, BorderLayout.CENTER);
        pInterfaz.revalidate();
        pInterfaz.repaint();
    }

    private void bPrincipalMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bPrincipalMouseEntered
        // TODO add your handling code here:
        bPrincipal.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bPrincipal.setBackground(new java.awt.Color(69, 17, 119));
    }//GEN-LAST:event_bPrincipalMouseEntered

    private void bPrincipalMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bPrincipalMouseExited
        // TODO add your handling code here:
        bPrincipal.setBackground(new java.awt.Color(56, 14, 97));
    }//GEN-LAST:event_bPrincipalMouseExited

    private void bAgregarMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bAgregarMouseEntered
        // TODO add your handling code here:
        bAgregar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bAgregar.setBackground(new java.awt.Color(69, 17, 119));
    }//GEN-LAST:event_bAgregarMouseEntered

    private void bAgregarMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bAgregarMouseExited
        // TODO add your handling code here:
        bAgregar.setBackground(new java.awt.Color(56, 14, 97));
    }//GEN-LAST:event_bAgregarMouseExited

    private void bModificarMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bModificarMouseEntered
        // TODO add your handling code here:
        bModificar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bModificar.setBackground(new java.awt.Color(69, 17, 119));
    }//GEN-LAST:event_bModificarMouseEntered

    private void bModificarMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bModificarMouseExited
        // TODO add your handling code here:
        bModificar.setBackground(new java.awt.Color(56, 14, 97));
    }//GEN-LAST:event_bModificarMouseExited

    private void bEliminarMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bEliminarMouseEntered
        // TODO add your handling code here:
        bEliminar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bEliminar.setBackground(new java.awt.Color(69, 17, 119));
    }//GEN-LAST:event_bEliminarMouseEntered

    private void bEliminarMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bEliminarMouseExited
        // TODO add your handling code here:
        bEliminar.setBackground(new java.awt.Color(56, 14, 97));
    }//GEN-LAST:event_bEliminarMouseExited

    private void bPrincipalMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bPrincipalMouseClicked
        // TODO add your handling code here:
        bPrincipal.setBackground(new java.awt.Color(42, 10, 73));
        mostrarPanel(new pPrincipal());
    }//GEN-LAST:event_bPrincipalMouseClicked

    private void bAgregarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bAgregarMouseClicked
        // TODO add your handling code here:
        bAgregar.setBackground(new java.awt.Color(42, 10, 73));
        mostrarPanel(new pAñadir());
    }//GEN-LAST:event_bAgregarMouseClicked

    private void bModificarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bModificarMouseClicked
        // TODO add your handling code here:
        bModificar.setBackground(new java.awt.Color(42, 10, 73));
        mostrarPanel(new pModificar());
    }//GEN-LAST:event_bModificarMouseClicked

    private void bEliminarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bEliminarMouseClicked
        // TODO add your handling code here:
        bEliminar.setBackground(new java.awt.Color(42, 10, 73));
        mostrarPanel(new pEliminar());
    }//GEN-LAST:event_bEliminarMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(HoystMarkPlanet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(HoystMarkPlanet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(HoystMarkPlanet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(HoystMarkPlanet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HoystMarkPlanet().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel bAgregar;
    private javax.swing.JPanel bEliminar;
    private javax.swing.JPanel bModificar;
    private javax.swing.JPanel bPrincipal;
    private javax.swing.JPanel background;
    private javax.swing.JPanel header;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel lAgregar;
    private javax.swing.JLabel lEliminar;
    private javax.swing.JLabel lFecha;
    private javax.swing.JLabel lMenu;
    private javax.swing.JLabel lModificar;
    private javax.swing.JLabel lSeparador;
    private javax.swing.JLabel lTitulo;
    private javax.swing.JPanel menu;
    private javax.swing.JPanel pInterfaz;
    // End of variables declaration//GEN-END:variables
}
