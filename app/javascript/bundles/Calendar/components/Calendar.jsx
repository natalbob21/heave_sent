import React, { Component } from "react";
import dateFns from "date-fns";
import Header from "./Header";
import Days from "./Days";
import Cells from "./Cells";

class Calendar extends Component {
  state = {
    currentMonth: new Date(),
    currentDate: new Date()
  };

  nextMonth = () => {
    this.setState({
      currentMonth: dateFns.addMonths(this.state.currentMonth, 1)
    });
  };

  prevMonth = () => {
    this.setState({
      currentMonth: dateFns.subMonths(this.state.currentMonth, 1)
    });
  };

  render() {
    console.log("hello world");
    console.log("hello world");
    console.log("hello world");
    console.log("hello world");
    console.log("hello world");
    const { currentMonth, currentDate } = this.state;
    return (
      <div className="calendar">
        <Header
          currentMonth={currentMonth}
          nextMonth={this.nextMonth}
          prevMonth={this.prevMonth}
        />
        <Days />
        <Cells currentMonth={currentMonth} currentDate={currentDate} />
      </div>
    );
  }
}

export default Calendar;
