class Controller {
  final IUpdateController iUpdateController;
  int counter = 0;

  Controller(this.iUpdateController);

  add(){
    counter++;

    iUpdateController.onUpdate();
  }

  decrement(){
    counter--;

    iUpdateController.onUpdate();
  }
}

abstract class IUpdateController {
  onUpdate();
}