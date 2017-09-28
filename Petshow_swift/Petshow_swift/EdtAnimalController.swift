//
//  EdtAnimalController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//


import UIKit

class EdtAnimalController:UITableViewController  {
    
    
    var pickerViewTipoAnimal:PickerViewTipoAnimal?
    var pickerViewRaca:PickerViewRaca?
    var animal:Animal!
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    @IBOutlet var imageAnimal: PickerImageView!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var segmentSexo: UISegmentedControl!
    @IBOutlet weak var txtAnimal: UITextField!
    @IBOutlet weak var txtRaca: UITextField!
    @IBOutlet weak var txtNascimento: UITextField!
    @IBOutlet weak var cellVermifugo: UITableViewCell!
    @IBOutlet weak var cellVacinas: UITableViewCell!
    @IBOutlet weak var cellTratamento: UITableViewCell!
    @IBOutlet weak var cellDeleteAnimal: UITableViewCell!
    @IBOutlet var navigation: UINavigationItem!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageAnimal.prepare(controller: self)
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
    
    @IBAction func validationSaveAnimal(_ sender: UIBarButtonItem) {
        if(!ValidationUtil.validationTextFieldString(txt: txtAnimal)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe qual o animal!")
            return
        }
        if(!ValidationUtil.validationTextFieldString(txt: txtNome)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe um nome para seu pet!")
            return
        }
        
        saveAnimal()
    }
    @IBAction func returnListAnimals(_ sender: Any) {
        returnListAnimal()
        
    }
    @IBAction func backToListAnimal(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func openDate(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        
        if ((cellVacinas == currentCell || cellVermifugo == currentCell || cellTratamento == currentCell) && (animal.id == nil || (animal.id?.intValue)! == 0)) {
            ComponentsUtil.criationAlertValidation(controller: self, message: "O animal ainda não foi cadastrado")
            
        }else{
            if( cellVacinas == currentCell){
                self.performSegue(withIdentifier: "segueVacina", sender:self)
            }
            if( cellVermifugo == currentCell){
                self.performSegue(withIdentifier: "segueVermifugo", sender:self)
            }
            if( cellTratamento == currentCell){
                self.performSegue(withIdentifier: "segueTratamento", sender:self)
            }
        }
        
        if( cellDeleteAnimal == currentCell){
            validationDeleteAnimal()
        }
    }
    
    
    func callBackSalvarAnimal(json:[String: AnyObject]) -> Void{
        JsonUtil.setfieldsJsonReturn(entidade:self.animal!, json:json)
        
        DispatchQueue.main.async {
            self.loadFields(animal:self.animal!)
            self.indicadorProgress.close()
        }
    }
    
    func callBackSalvarTutor(json:[String: AnyObject]) -> Void{
        let tutor:Tutor = Tutor()
        
        JsonUtil.setfieldsJsonReturn(entidade:tutor, json:json)
        
        self.animal = tutor.animal
        
        DispatchQueue.main.async {
            self.loadFields(animal:self.animal!)
            self.indicadorProgress.close()
        }
    }
    
    func validationDeleteAnimal () {
        if(!ValidationUtil.validationNumber(number: animal.id)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Animal ainda não foi cadastrado!")
            return
        }
        
        ComponentsUtil.criationOptionSheet(controller: self, message: "Tem certeza que deseja deletar " + (animal.nome?.description)! + "?", functionOk: self.deleteAnimal, functionCancel: nil)
    }
    
    func saveAnimal() {
        getEntityScreenFields()
        
        self.indicadorProgress.open("Salvando", controller: self)
        
        DispatchQueue.main.async {
            if(ValidationUtil.validationNumber(number: self.animal.id)){
                CallRest.requestPostEntity(url: "animal/salvar", entidade: self.animal, callBack: self.callBackSalvarAnimal, callBackError: self.error)
            }else{
                let tutor:Tutor = Tutor()
                tutor.animal = self.animal
                tutor.usuario = FacebookUtil.usuarioLogado
                CallRest.requestPostEntity(url: "animal/tutor/salvar", entidade: tutor, callBack: self.callBackSalvarTutor, callBackError: self.error)
            }
        }
        
    }
    
    func deleteAnimal() {
        DispatchQueue.main.async {
            CallRest.requestDeleteEntity(url: "animal/"+(self.animal.id?.description)!, callBack: self.backDelete, callBackError:self.error )
        }
    }
    
    
    func backDelete(json:[String:AnyObject]) -> Void{
        returnListAnimal()
        
    }
    func returnListAnimal(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    
    func handleDatePicker(sender: UIDatePicker) {
        txtNascimento.text = DateUtil.formartarDataBrasil(date: sender.date)
        
    }
    
    func doneButtonAction(sender:UIButton) {
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
        imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: (animal.fotoPerfil)!)
        navigation.title = animal.nome?.description
        txtNascimento.text = DateUtil.formartarDataBrasil(date: animal.dataNascimento!)
        if (animal.flSexo?.description == "M"){
            segmentSexo.selectedSegmentIndex = 0
        }else{
            segmentSexo.selectedSegmentIndex = 1
        }
    }
    func getEntityScreenFields(){
        animal.nome = NSString(string: txtNome.text!)
        animal.tipo = EnumTipoAnimal.getEnum(orderId: (pickerViewTipoAnimal?.rowSelected)!)
        animal.raca = pickerViewRaca?.getSelectedRaca()
        animal.fotoPerfil = ImageUtil.imageToNSString64(image: imageAnimal.image!)
        animal.dataNascimento = DateUtil.dataBrasilToDate(date: txtNascimento.text!)
        animal.flSexo = ( segmentSexo.selectedSegmentIndex == 0 ?"M":"F")
        
        
    }
    
    
}
