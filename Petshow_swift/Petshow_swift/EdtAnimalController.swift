//
//  EdtAnimalController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//


import UIKit

class EdtAnimalController:UITableViewController {
    
    @IBOutlet weak var imgAnimal: UIImageView!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var segmentSexo: UISegmentedControl!
    @IBOutlet weak var txtAnimal: UITextField!
    @IBOutlet weak var txtRaca: UITextField!
    @IBOutlet weak var txtNascimento: UITextField!
    
    var txt:UITextField!
    var rowSelected = -1
    var animal:Animal!
    
    @IBOutlet weak var cellVermifugo: UITableViewCell!
    @IBOutlet weak var cellVacinas: UITableViewCell!
    @IBOutlet weak var cellTratamento: UITableViewCell!
    @IBOutlet weak var cellDeleteAnimal: UITableViewCell!
    
    @IBOutlet var navigation: UINavigationItem!
    
    var pickerViewTipoAnimal:PickerViewTipoAnimal?
    var pickerViewRaca:PickerViewRaca?
    
    @IBAction func returnListAnimals(_ sender: Any) {
        
        returnListAnimal()
        
        
    }
    
   
    @IBAction func saveAnimal(_ sender: UIBarButtonItem) {
        getEntityScreenFields()
        
        if(animal.nome != nil && animal.tipo != nil && animal.raca != nil){
            CallRest.requestPostEntity(url: "animal/saldadasvar", entidade: self.animal, callBack: callBackSalvarAnimal, callBackError: errorDelete)
        }
    
    }
    
    func callBackSalvarAnimal(json:[String: AnyObject]) -> Void{
        var retorno = "retorno"
        //        DispatchQueue.main.sync {
//            self.dismiss(animated: true, completion: nil)
//        }
    }
    

    
    func deleteAnimal() {
        CallRest.requestDeleteEntity(url: "animal/"+(animal.id?.description)!, callBack: self.backDelete, callBackError:self.errorDelete )
    }
    
    
    func backDelete(json:[String:AnyObject]) -> Void{
        returnListAnimal()
        
    }
    func returnListAnimal(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func errorDelete(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let  raca = animal == nil ? nil : (animal.raca?.description)!
        let  tipo = animal == nil ? nil :  (animal.tipo)
      
        pickerViewRaca = PickerViewRaca().prepare(textField:txtRaca,controller: self, raca: raca)
        
        pickerViewTipoAnimal = PickerViewTipoAnimal().prepare(textField:txtAnimal,controller: self,pickerViewRaca,enumTp : tipo)
        
        
        if(animal != nil){
            loadFields(animal:self.animal)
        }else{
            animal = Animal()
            navigation.title = "Novo"
            
        }
    }
    
    @IBAction func openDate(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        
        if( cellVacinas == currentCell){
            self.performSegue(withIdentifier: "segueVacina", sender:self)
        }
        if( cellVermifugo == currentCell){
            self.performSegue(withIdentifier: "segueVermifugo", sender:self)
        }
        if( cellTratamento == currentCell){
            self.performSegue(withIdentifier: "segueTratamento", sender:self)
        }
        
        if( cellDeleteAnimal == currentCell){
            deleteAnimal()
        }
    }
    
    
   
    
    func handleDatePicker(sender: UIDatePicker) {
        
        txtNascimento.text = DateUtil.formartarDataBrasil(date: sender.date)
        
    }
    
    func doneButtonAction(sender:UIButton)
    {
        txtNascimento.resignFirstResponder()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueVacina" {
            let controller =  segue.destination as? VacinaListaController
            controller?.animal = animal
        }
        
        if segue.identifier == "segueVermifugo" {
            let controller =  segue.destination as? EdtVermifugoController
            controller?.animal = animal
        }
        
        if segue.identifier == "segueTratamento" {
            let controller =  segue.destination as? TratamentoListaController
            controller?.animal = animal
        }
        
    }
    
    func loadFields(animal:Animal){
        txtNome.text = animal.nome?.description
        txtAnimal.text = animal.tipo?.rawValue
        txtRaca.text = animal.raca?.description
        imgAnimal.image = ImageUtil.nsString64ToImage(stringImage: (animal.fotoPerfil)!)
        navigation.title = animal.nome?.description
//        txtNascimento.text = DateUtil.formartarNsDataBrasil(date: animal.dataNascimento!)
        if (animal.flSexo?.description == "M"){
            segmentSexo.selectedSegmentIndex = 0
        }else{
            segmentSexo.selectedSegmentIndex = 1
        }
    }
    func getEntityScreenFields(){
        animal.nome? = txtNome.text as! NSString
        animal.tipo = EnumTipoAnimal.getEnum(orderId: (pickerViewTipoAnimal?.rowSelected)!) 
        animal.raca = pickerViewRaca?.getSelecteRaca() as! NSString
        animal.fotoPerfil = ImageUtil.imageToNSString64(image: imgAnimal.image!)
//        animal.dataNascimento = DateUtil.dataBrasilToNSDate(date: txtNascimento.text!)
//        animal.flSexo = ( segmentSexo.selectedSegmentIndex == 0 ?"M":"F")
    
    }
    
    
}
