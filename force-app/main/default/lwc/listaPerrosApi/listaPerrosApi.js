import { LightningElement, wire } from "lwc";
import obtenerRazas from "@salesforce/apex/forecastService.obtenerRazas";
export default class ListaPerrosApi extends LightningElement {
  breeds = [];
  error;

  @wire(obtenerRazas)
  wiredBreeds({ error, data }) {
    if (data) {
      console.log("Data recibida:", data);

      this.breeds = Object.keys(data).map((key) => {
        return {
          name: key,
          subBreeds: data[key]
        };
      });

      this.error = undefined;
    } else if (error) {
      console.log("Error:", error);
      this.error = error;
      this.breeds = [];
    }
  }
}
