//
//  SnapsViewController.swift
//  ProyectoFinal
//
//  Created by Diego Escobedo on 11/15/22.
//  Copyright © 2022 Diego. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {


    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var listaCategorias: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
