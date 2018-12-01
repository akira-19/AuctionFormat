//
//  TemplateTableViewController.swift
//  auctionFormat
//
//  Created by akira on 2018-03-28.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit



class TemplateTableViewController: UITableViewController {
    
    static var template = ["template1","template2","template3"]
   static var tempContent = ["content1","content2","content3"]

    @IBAction func unwindToTemplate(sender: UIStoryboardSegue){
        guard let sourceVC = sender.source as?  AddTemplateViewController, let template = sourceVC.templateTitle, let tempContent = sourceVC.template  else {
            return
        }
        TemplateTableViewController.template.append(template)
        TemplateTableViewController.tempContent.append(tempContent)
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToNewTemplate(sender: UIStoryboardSegue){
        guard let sourceVC = sender.source as?  EditTemplateViewController, let template = sourceVC.templateTitle, let tempContent = sourceVC.template  else {
            return
        }
        TemplateTableViewController.template.append(template)
        TemplateTableViewController.tempContent.append(tempContent)
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToKeptTemplate(sender: UIStoryboardSegue){
        guard let sourceVC = sender.source as?  EditTemplateViewController, let template = sourceVC.templateTitle, let tempContent = sourceVC.template  else {
            return
        }
        if let selectedInexPath = self.tableView.indexPathForSelectedRow{
            TemplateTableViewController.template[selectedInexPath.row] = template
            TemplateTableViewController.tempContent[selectedInexPath.row] = tempContent

        }
        self.tableView.reloadData()
    }
    
    
     @IBAction func backToTable(segue: UIStoryboardSegue) {}

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TemplateTableViewController.template.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "templateTableViewCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = TemplateTableViewController.template[indexPath.row]
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let identifier = segue.identifier else {
            return
        }
        if identifier == "editTemplate"{
            let tempVC = segue.destination as! EditTemplateViewController
            tempVC.templateTitle = TemplateTableViewController.template[(self.tableView.indexPathForSelectedRow?.row)!]
            tempVC.template = TemplateTableViewController.tempContent[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
    

}
