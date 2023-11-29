/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package cl.duoc.hoystmarkplanet.Views.img;

import cl.duoc.hoystmarkplanet.DTO.PeliculaDTO;
import cl.duoc.hoystmarkplanet.Service.impl.PeliculaService;
import cl.duoc.hoystmarkplanet.Service.iPelicula;
import javax.swing.JOptionPane;

/**
 *
 * @author fabia
 */
public class pAñadir extends javax.swing.JPanel {

    private static iPelicula servicio;

    public pAñadir() {
        initComponents();

        if (servicio == null) {
            servicio = new PeliculaService();
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        lTitulo = new javax.swing.JLabel();
        iPelicula = new javax.swing.JLabel();
        tTitulo = new javax.swing.JTextField();
        boxGenero = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        tAño = new javax.swing.JTextField();
        tDuracion = new javax.swing.JTextField();
        tDirector = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        bDescartar = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        bConfirmar = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setFocusable(false);
        setMaximumSize(new java.awt.Dimension(780, 403));
        setPreferredSize(new java.awt.Dimension(750, 400));

        jLabel1.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 51, 51));
        jLabel1.setText("Titulo");

        lTitulo.setFont(new java.awt.Font("Verdana", 0, 30)); // NOI18N
        lTitulo.setForeground(new java.awt.Color(0, 0, 0));
        lTitulo.setText("Guardar Pelicula");

        iPelicula.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iPelicula.png"))); // NOI18N

        tTitulo.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tTitulo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tTituloActionPerformed(evt);
            }
        });

        boxGenero.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        boxGenero.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar", "Comedia", "Drama", "Acción", "Terror", "Suspenso", "Romance" }));

        jLabel2.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(51, 51, 51));
        jLabel2.setText("Año");

        jLabel7.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(51, 51, 51));
        jLabel7.setText("Duración");

        jLabel8.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(51, 51, 51));
        jLabel8.setText("Director");

        tAño.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tAño.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tAñoActionPerformed(evt);
            }
        });

        tDuracion.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tDuracion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tDuracionActionPerformed(evt);
            }
        });

        tDirector.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tDirector.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tDirectorActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(51, 51, 51));
        jLabel9.setText("Género");

        bDescartar.setBackground(new java.awt.Color(56, 14, 97));
        bDescartar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bDescartar.setPreferredSize(new java.awt.Dimension(104, 35));
        bDescartar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bDescartarMouseClicked(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                bDescartarMouseExited(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(204, 204, 204));
        jLabel10.setText("Limpiar");

        javax.swing.GroupLayout bDescartarLayout = new javax.swing.GroupLayout(bDescartar);
        bDescartar.setLayout(bDescartarLayout);
        bDescartarLayout.setHorizontalGroup(
            bDescartarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bDescartarLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jLabel10)
                .addContainerGap(18, Short.MAX_VALUE))
        );
        bDescartarLayout.setVerticalGroup(
            bDescartarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, bDescartarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        bConfirmar.setBackground(new java.awt.Color(56, 14, 97));
        bConfirmar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        bConfirmar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bConfirmarMouseClicked(evt);
            }
        });

        jLabel11.setFont(new java.awt.Font("Verdana", 0, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(204, 204, 204));
        jLabel11.setText("Confirmar");

        javax.swing.GroupLayout bConfirmarLayout = new javax.swing.GroupLayout(bConfirmar);
        bConfirmar.setLayout(bConfirmarLayout);
        bConfirmarLayout.setHorizontalGroup(
            bConfirmarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bConfirmarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel11)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        bConfirmarLayout.setVerticalGroup(
            bConfirmarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(bConfirmarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel11)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(187, 187, 187)
                        .addComponent(lTitulo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(iPelicula))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(213, 213, 213)
                        .addComponent(bDescartar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(46, 46, 46)
                        .addComponent(bConfirmar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(116, 248, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGap(78, 78, 78)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(tDuracion, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel8)
                                    .addComponent(tDirector, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(jLabel7))
                        .addGap(94, 94, 94)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel9)
                            .addComponent(boxGenero, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tTitulo, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tAño, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2))
                        .addGap(148, 148, 148))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lTitulo)
                    .addComponent(iPelicula, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(tTitulo, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(tAño, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addGap(12, 12, 12)
                        .addComponent(tDirector, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel7))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(43, 43, 43)
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(boxGenero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(tDuracion, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(65, 65, 65)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(bDescartar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(bConfirmar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 31, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void tTituloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tTituloActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tTituloActionPerformed

    private void tAñoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tAñoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tAñoActionPerformed

    private void tDuracionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tDuracionActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tDuracionActionPerformed

    private void tDirectorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tDirectorActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tDirectorActionPerformed

    private void bDescartarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bDescartarMouseClicked
        // TODO add your handling code here:
        bDescartar.setBackground(new java.awt.Color(42, 10, 73));
        tTitulo.setText("");
        tDirector.setText("");
        tDuracion.setText("");
        tAño.setText("");
        boxGenero.setSelectedIndex(0);
    }//GEN-LAST:event_bDescartarMouseClicked

    private void bDescartarMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bDescartarMouseExited
        // TODO add your handling code here:
        bDescartar.setBackground(new java.awt.Color(56, 14, 97));
    }//GEN-LAST:event_bDescartarMouseExited

    private void bConfirmarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bConfirmarMouseClicked
        // TODO add your handling code here:
        bConfirmar.setBackground(new java.awt.Color(42, 10, 73));
        String genero = null;
        String titulo = null;
        String director = null;
        Integer año = null;
        Integer duracion = null;

        titulo = tTitulo.getText().toUpperCase();
        director = tDirector.getText();
        try {
            año = Integer.parseInt(tAño.getText());
            duracion = Integer.parseInt(tDuracion.getText());
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Tipo de dato incorrecto.", "ERROR", JOptionPane.ERROR_MESSAGE);

        }
        if (boxGenero.getSelectedIndex() > 0) {
            genero = boxGenero.getSelectedItem().toString();
        }

        try {
            servicio.guardar(new PeliculaDTO(titulo, director, año, duracion, genero));
            System.out.println("Guardado exitosamente");
            System.out.println(servicio.listar());
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error al intentar guardar la película.", "ERROR", JOptionPane.ERROR_MESSAGE);
            System.out.println("No guardado: " + ex.getMessage());
        }

    }//GEN-LAST:event_bConfirmarMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel bConfirmar;
    private javax.swing.JPanel bDescartar;
    private javax.swing.JComboBox<String> boxGenero;
    private javax.swing.JLabel iPelicula;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JLabel lTitulo;
    private javax.swing.JTextField tAño;
    private javax.swing.JTextField tDirector;
    private javax.swing.JTextField tDuracion;
    private javax.swing.JTextField tTitulo;
    // End of variables declaration//GEN-END:variables
}
