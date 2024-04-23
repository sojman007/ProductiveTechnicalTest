import { LightningElement , wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import getAllSubscribers from '@salesforce/apex/SubscriberEnhancedListLwcController.getAllSubscribers';
const ITEMS_PER_PAGE = 10;

export default class SubscriberEnhancedList extends LightningElement {


    recordData = []

    includeDisconnected = false;
    currentPage = 1;

    filterValue;
    filteredRecords =[];

    @wire(getAllSubscribers,{throwException : false})
    handleRecordLoad({error,data}){
        if(error){
            const toast = new ShowToastEvent({
                title:'Error',message:error.body?.message, variant:'error'
            })

            this.dispatchEvent(toast);

        }else if(data){
            console.log(data)
            if(data.length >0){
                this.recordData = [...data]
            }else{
                const toast = new ShowToastEvent({
                    title:'No data',message:'No Subscriber Data In the Org', variant:'warning'
                })

                this.dispatchEvent(toast);

            }
        }
    }



    get columns(){
        return [
            {
                label:'Name', fieldName:'name'
            },{
                label:'Phone', fieldName:'phone'
            },{
                label:'Email', fieldName:'email'
            },{
                label:'Country', fieldName:'country'
            },{
                label:'Status', fieldName:'status'
            },{
                label:'Data Used', fieldName:'dataUsed'
            },{
                label:'Date', fieldName:'dateJoined'
            }
        ];
    }





    get tableData(){
        // apply filters , then paginate
        let tableData = [...this.recordData];
        if(! this.includeDisconnected){
            tableData = tableData.filter(data => data.status !=='DISCONNECTED');
        }
        if(this.filterValue){
            tableData = tableData.filter(record => record.name.includes(this.filterValue)|| record.phone.includes(this.filterValue))
        }

        if(tableData.length > 0){
            this.filteredRecords =[...tableData]
            // paginate
            return this.paginate(tableData, this.currentPage, ITEMS_PER_PAGE);

        }
        
            
        
    }


    paginate(data , pagenumber, pagesize){
        const startIndex = (pagenumber - 1) * pagesize;
        const endIndex = startIndex + pagesize;

        const pageItems = data.slice(startIndex, endIndex);

        return pageItems;
        
    }

    onChange(event){
        let name = event.target.name;
        console.log(event.target.name);
        console.log(event.detail);
        if(name === 'filter'){
            this.filterValue = event.detail.value;
        }else if(name === 'include'){
            this.includeDisconnected = event.target.checked;
        }
    }

    get pageNumbers(){
        if(this.filteredRecords){
            const recordTotal = this.filteredRecords.length;
            console.log('table data length : ' , recordTotal);
            const totalPages = recordTotal  < ITEMS_PER_PAGE ? 1 :
            //recordTotal % ITEMS_PER_PAGE > 0 ? Math.round((recordTotal / ITEMS_PER_PAGE) + 1)
               Math.round(recordTotal / ITEMS_PER_PAGE);
            console.log('total pages ' , totalPages);
            return totalPages;
        }

    }

    get currentPageNumber(){
        return this.currentPage;
    }

    
    handleNextClicked(){
        if(this.currentPage < this.pageNumbers){
            this.currentPage += 1;
        }

    }
    handlePreviousClicked(){
        if(this.currentPage >= 2){
            this.currentPage -= 1;
        }

    }

    get hasPrevious(){
        return (this.currentPage > 1 && (this.currentPage <= this.pageNumbers));
    }

    get hasNext(){
        return this.currentPage < this.pageNumbers;
        
    }

   

}