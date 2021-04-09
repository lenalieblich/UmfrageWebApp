import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {JwtHelperService} from '@auth0/angular-jwt';


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private readonly JWT_TOKEN = 'JWT_TOKEN';
  private readonly REFRESH_TOKEN = 'REFRESH_TOKEN';
  private loggedUser: string;

  url = 'http://localhost/UmfrageWebApp/PHP_Files/logic.php';


  constructor(private http: HttpClient, public jwtHelper: JwtHelperService) {

  }


  public isAuthenticated(): boolean {
    const token = localStorage.getItem('token');
    // Check whether the token is expired and return
    // true or false
    return !this.jwtHelper.isTokenExpired(token);
  }

  postUserData(postData: string): Observable<any> {
    return this.http.post<string>(this.url, postData, {responseType: 'json'});
  }

  updateServer(postData: string): Observable<any> {
    return this.http.post<string>(this.url, postData, {responseType: 'text' as 'json'});
  }

  isLoggedIn() {

  }


}
